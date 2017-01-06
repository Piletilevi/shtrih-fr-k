# coding: utf-8

from os import path
from sys import argv, stdin
from System import Type, Activator
from yaml import load as loadYAML
from time import sleep


BASEDIR = path.realpath(path.dirname(argv[0]))
with open(path.join(BASEDIR, 'ECRModes.yaml'), 'r') as ecrmode_table_file:
	ECRMODE_TABLE = loadYAML(ecrmode_table_file)['ECRMode']

USER_SADM = 30000
USER_ADM = 29000
USER_KASSIR = 1000

RETRY_SEC = 0.1
TIMEOUT_SEC = 2

def ecr_mode_string(k):
	return str(k) + ":" + ECRMODE_TABLE[k]['name']

def prc():
	if v.ResultCode:
		print str(v.ResultCode) + ':' + v.ResultCodeDescription
		print "ENTER to exit(1)"
		stdin.readline()
		exit(1)


def insist(method, password):
	global v
	v.Password = password
	method()
	if v.ResultCode:
		while v.ResultCode:
			print str(v.ResultCode) + ':' + v.ResultCodeDescription
			print "ENTER to retry"
			stdin.readline()
			method()
	v.Password = 0


def connect():
	global v
	insist(v.WaitConnection, USER_KASSIR)
	insist(v.Connect, USER_KASSIR)
	prc()


def closeShift():
	global v
	print "performing PrintReportWithCleaning() (Press ENTER)"
	stdin.readline()
 	insist(v.PrintReportWithCleaning, USER_ADM)
 	prc()


def openShift():
	global v
	print "performing PrintReportWithoutCleaning() (Press ENTER)"
	stdin.readline()
 	insist(v.PrintReportWithoutCleaning, USER_ADM)
 	prc()
	insist(v.OpenSession, USER_ADM)
 	prc()
 	# Shift will be actually opened with first recipe


def sysAdminCancelCheck():
	global v
	v.Password = USER_SADM
	v.SysAdminCancelCheck()


def setMode2():
	global v
	timecount = 0

	print "Initial ECRMode " + ecr_mode_string(v.ECRMode)

	if v.ECRMode == 8:
		insist(v.Beep, USER_KASSIR)
		print "Waiting for mode change"
		print "v.ECRMode8Status " + str(v.ECRMode8Status)
		while v.ECRMode == 8:
			insist(v.GetShortECRStatus, USER_KASSIR)
			sleep(RETRY_SEC)
			timecount = timecount + RETRY_SEC
			if timecount > TIMEOUT_SEC:
				timecount = 0
				print "sysAdminCancelCheck"
				sysAdminCancelCheck()
		print "ECRMode " + ecr_mode_string(v.ECRMode)

	insist(v.ResetECR, USER_KASSIR)
	prc()

	if v.ECRMode == 0:
		insist(v.Beep, USER_KASSIR)
		print "Waiting for mode change"
		while v.ECRMode == 0:
			insist(v.GetShortECRStatus, USER_KASSIR)
			sleep(RETRY_SEC)

	if v.ECRMode not in [2,3,4]:
		print "Can't go on with ECRMode: " + ecr_mode_string(v.ECRMode)
		print "Exiting (Press ENTER)"
		stdin.readline()
		exit(1)

	if v.ECRMode == 3:
		print ecr_mode_string(v.ECRMode)
		closeShift()

	if v.ECRMode == 4:
		print ecr_mode_string(v.ECRMode)
	 	openShift()


def sale(sales_options, payment_options, password = USER_KASSIR):
	# print sales_options
	for item in sales_options:
		print('unpacking {0}'.format(item))
		for attr, value in {
			'Quantity': item['amount'],
			'Price': item['cost'],
			'Department': 1,
			'Tax1': item['vatPerc'],
			'Tax2': 0,
			'Tax3': 0,
			'Tax4': 0,
			'StringForPrinting': item['name']
		}.iteritems():
			print 'Setting {0} = {1}'.format(attr, value)
			setattr(v, attr, value)
		print 'SALEEEE'
		insist(v.sale, password)

	for item in payment_options:
		for attr, value in {
			'Summ1': item['cost'] if item['type'] == 1 else 0,
			'Summ1': item['cost'] if item['type'] == 2 else 0,
			'Summ1': item['cost'] if item['type'] == 3 else 0,
			'Summ1': item['cost'] if item['type'] == 4 else 0,
			'DiscountOnCheck': 0
		}.iteritems():
			print 'Setting ' + attr + ' = ' + str(value)
			setattr(v, attr, value)

	print v.Tax1
	print v.Tax2
	print v.Tax3
	print v.Tax4
	print v.Summ1
	print v.Summ2
	print v.Summ3
	print v.Summ4
	print v.DiscountOnCheck

	insist(v.CloseCheck, password)


def printLine(string = ' '):
	setattr(v, 'UseReceiptRibbon', True)
	setattr(v, 'UseJournalRibbon', False)
	setattr(v, 'StringForPrinting', string)
	print ('Printing on receipt: "{0}"'.format(string))
	insist(v.PrintString, USER_KASSIR)


def feed(feedLineCount = 4):
	for x in xrange(0, feedLineCount):
		printLine()


def cut(feedAfterCutCount = 0, cutType = True, password = USER_KASSIR):
	feed()
	if (feedAfterCutCount == 0):
		setattr(v, 'FeedAfterCut', False)
	else:
		setattr(v, 'FeedAfterCut', True)
		setattr(v, 'FeedLineCount', feedAfterCutCount)
	setattr(v, 'CutType', cutType)
	insist(v.CutCheck, password)


# v.Quantity=1000
# v.Price=1.56
# v.Department=1
# v.Tax1=1
# v.Tax2=2
# v.Tax3=0
# v.Tax4=0
# v.StringForPrinting= 'Спичечный коробок'
# v.Sale()


oo = Type.GetTypeFromProgID('Addin.DrvFR')
v = Activator.CreateInstance(oo)
prc()
