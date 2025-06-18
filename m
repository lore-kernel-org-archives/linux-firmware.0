Return-Path: <SRS0=AzFS=ZB=thebeautyboxx.co=info@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA6C71157
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Jun 2025 07:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEBB7C4CEED; Wed, 18 Jun 2025 07:01:18 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021131.outbound.protection.outlook.com [40.107.57.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94E91C4CEE7
	for <linux-firmware@kernel.org>; Wed, 18 Jun 2025 07:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94E91C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=thebeautyboxx.co
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=thebeautyboxx.co
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFduyxNyjY2GgPlhjMJ5EMZShYZSaIFwPOvnqrhh02qf3wpz0RihMutVx/98rD6NVrtjOXnzh+fE5QmDyID+cHCn0yZWMLFdDscSaacCyj0La8D72hPFoQQSgVQHWJaGNh4UA8G29nMCXZdpX+LDjHE+KxuB6HE9onP8Xm/98usOLAQd49Fy5R80xM22JZgmBxfU33mHN2BtnJGZ+NHYRuXgNxeBK9y04N+7OFRZEI/E1VttMQMWZf+s2LRuJpDJFeSCPHkZxvSacSZ1v1iersA83MR4m2U0sHIDodrXSW52+2K60ODW0XXCGqk2ozNtB2nAouY+ITfJrEQcVQFs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FSPCMZp0TLBkoBE992IkuQM/sVikye+73DCn9AMVJ4=;
 b=xXtMImSdD3nliO1YIcBVRlqO5tDBHl/YM1coXZ8EyCbqBsZWodYMiZj9fd1TpPP01JVT2GrrcR2Q550TODgDjEENRlqEkpe+xEyE6oUB+ful2Dimp5Qh4xiq92VSRx2RVcU9398C28r4WPiCcuj3E64dXCbPEl7aPbPpGQ6VsAHgwIll4/gV8fofMHphhSiWHfFFv6uFSy4NDQpUpKNGlGGMHys6XwDorAmwWT41FGCeB2IPXUqz29bUsNtbsbIjOcxbiRe5kD9Nx2rc75KmAPUGI+Z/CY6SwGjd2JhjNM1SagH2fh5ImgdJ0D/V0A6tpP0PFtEca35GD9GroNGq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thebeautyboxx.co; dmarc=pass action=none
 header.from=thebeautyboxx.co; dkim=pass header.d=thebeautyboxx.co; arc=none
Received: from PN3P287MB3142.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:227::21)
 by MA0P287MB0347.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 07:01:10 +0000
Received: from PN3P287MB3142.INDP287.PROD.OUTLOOK.COM
 ([fe80::f2df:85e2:95ed:8477]) by PN3P287MB3142.INDP287.PROD.OUTLOOK.COM
 ([fe80::f2df:85e2:95ed:8477%5]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 07:01:10 +0000
From: thebeauty boxx <info@thebeautyboxx.co>
List-Id: <linux-firmware.lore.kernel.org>
To: "snhclinics@gmail.com" <snhclinics@gmail.com>, "clinicaks@gmail.com"
	<clinicaks@gmail.com>, "james@jamesbendreyaccountants.co.uk"
	<james@jamesbendreyaccountants.co.uk>, "garekarsmd@gmail.com"
	<garekarsmd@gmail.com>, "jstory76@naver.com" <jstory76@naver.com>,
	"eureka_skin@naver.com" <eureka_skin@naver.com>,
	"emily@urbanedgebeauty.co.nz" <emily@urbanedgebeauty.co.nz>,
	"kiran.k@intel.com" <kiran.k@intel.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "ravishankar.srivatsa@intel.com"
	<ravishankar.srivatsa@intel.com>, "info@integratedwellness.in"
	<info@integratedwellness.in>, "feadback@IntegratedWellness.in"
	<feadback@IntegratedWellness.in>, "info@weljii.com" <info@weljii.com>,
	"vibrance.ggn@gmail.com" <vibrance.ggn@gmail.com>,
	"carmenasins.lesbarraques@gmail.com" <carmenasins.lesbarraques@gmail.com>,
	"site.sac@epocacosmeticos.com.br" <site.sac@epocacosmeticos.com.br>,
	"info@kayaindia.net" <info@kayaindia.net>, "care@kayaindia.net"
	<care@kayaindia.net>, "care@wuba.in" <care@wuba.in>, "dpo-nida@nida.ac.th"
	<dpo-nida@nida.ac.th>, "fj@amidagroup.in" <fj@amidagroup.in>,
	"drvipul@niceclinic.co.in" <drvipul@niceclinic.co.in>,
	"info@avyaskinclinic.com" <info@avyaskinclinic.com>,
	"doctormananmehta@gmail.com" <doctormananmehta@gmail.com>,
	"carmenasins.lesbarraques@gmail.com" <carmenasins.lesbarraques@gmail.com>,
	"contact@uncover.co.in" <contact@uncover.co.in>, "info@faswealthpartners.com"
	<info@faswealthpartners.com>, "pboudignon@atelierboudignon-architecte.fr"
	<pboudignon@atelierboudignon-architecte.fr>, "info@eugenix.in"
	<info@eugenix.in>, "pradeep@eugenix.in" <pradeep@eugenix.in>,
	"arika@eugenix.in" <arika@eugenix.in>, "contact@vlccwellness.com"
	<contact@vlccwellness.com>, "feedback@vlccwellness.com"
	<feedback@vlccwellness.com>, "kdj4907@kmou.ac.kr" <kdj4907@kmou.ac.kr>,
	"vlcc.hitech@gmail.com" <vlcc.hitech@gmail.com>, "contact@vlccgroup.com"
	<contact@vlccgroup.com>, "satyendra.pandit@vlccgroup.com"
	<satyendra.pandit@vlccgroup.com>, "valdilea.veloso@ini.fiocruz.br"
	<valdilea.veloso@ini.fiocruz.br>, "mauro.carneiro@ini.fiocruz.br"
	<mauro.carneiro@ini.fiocruz.br>, "contact@uncover.co.in"
	<contact@uncover.co.in>, "info@faswealthpartners.com"
	<info@faswealthpartners.com>, "pboudignon@atelierboudignon-architecte.fr"
	<pboudignon@atelierboudignon-architecte.fr>, "garekarsmd@gmail.com"
	<garekarsmd@gmail.com>, "jstory76@naver.com" <jstory76@naver.com>,
	"eureka_skin@naver.com" <eureka_skin@naver.com>,
	"emily@urbanedgebeauty.co.nz" <emily@urbanedgebeauty.co.nz>,
	"kiran.k@intel.com" <kiran.k@intel.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>, "ravishankar.srivatsa@intel.com"
	<ravishankar.srivatsa@intel.com>, "rejuvaskinclinic@yahoo.com"
	<rejuvaskinclinic@yahoo.com>, "contact@ekosight.com" <contact@ekosight.com>,
	"bindalclinic@gmail.com" <bindalclinic@gmail.com>, "info@dnsc.co.in"
	<info@dnsc.co.in>, "dr.nainsi19@gmail.com" <dr.nainsi19@gmail.com>,
	"info@ursaskin.com" <info@ursaskin.com>, "sales@shubhmlshah.com"
	<sales@shubhmlshah.com>, "aphroditecosmeticcentre@outlook.com"
	<aphroditecosmeticcentre@outlook.com>, "info@skinnsmiles.com"
	<info@skinnsmiles.com>, "Drgeetika@isaac-wellness.com"
	<Drgeetika@isaac-wellness.com>, "contact@drgeetika.info"
	<contact@drgeetika.info>, "contact@isaacluxe.co" <contact@isaacluxe.co>,
	"tarunrajput1978@gmail.com" <tarunrajput1978@gmail.com>,
	"info@smilestudiogurgaon.in" <info@smilestudiogurgaon.in>,
	"drspoint@gmail.com" <drspoint@gmail.com>, "EmailInfo@drspoint.com"
	<EmailInfo@drspoint.com>, "Info@drspoint.com" <Info@drspoint.com>,
	"booking@tangentinc.in" <booking@tangentinc.in>, "info@dentistgurugram.com"
	<info@dentistgurugram.com>, "emergencies@dentistgurugram.com"
	<emergencies@dentistgurugram.com>, "dramit@priveclinic.in"
	<dramit@priveclinic.in>, "dramitbhasin@hotmail.com"
	<dramitbhasin@hotmail.com>, "dramitbhasin@priveclinic.in"
	<dramitbhasin@priveclinic.in>, "garekarsmd@gmail.com" <garekarsmd@gmail.com>,
	"jstory76@naver.com" <jstory76@naver.com>, "eureka_skin@naver.com"
	<eureka_skin@naver.com>, "emily@urbanedgebeauty.co.nz"
	<emily@urbanedgebeauty.co.nz>, "kiran.k@intel.com" <kiran.k@intel.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"ravishankar.srivatsa@intel.com" <ravishankar.srivatsa@intel.com>,
	"inquiry@berkowits.in" <inquiry@berkowits.in>, "info@v6clinics.com"
	<info@v6clinics.com>, "moniqua@spaceyogastudio.com"
	<moniqua@spaceyogastudio.com>, "info@spaceyogastudio.com"
	<info@spaceyogastudio.com>, "info@reconfacialsurgery.com"
	<info@reconfacialsurgery.com>, "rcobo@imbanaco.com.co"
	<rcobo@imbanaco.com.co>, "termoplasticos@alpina.com.br"
	<termoplasticos@alpina.com.br>, "info@vr-sap.de" <info@vr-sap.de>,
	"info@vr-boardinghouse.de" <info@vr-boardinghouse.de>,
	"lorraine.discoverygardens@gmail.com" <lorraine.discoverygardens@gmail.com>,
	"mooshimtkd@gmail.com" <mooshimtkd@gmail.com>, "info@clinicdermatech.com"
	<info@clinicdermatech.com>, "moni.malviya@clinicdermatech.in"
	<moni.malviya@clinicdermatech.in>, "cd.ggn2@clinicdermatech.in"
	<cd.ggn2@clinicdermatech.in>, "cd.amritsar@clinicdermatech.in"
	<cd.amritsar@clinicdermatech.in>, "gmeditec@gilmdc.com"
	<gmeditec@gilmdc.com>, "info@dermatechclinics.com"
	<info@dermatechclinics.com>, "info@clinicdermatech.com"
	<info@clinicdermatech.com>, "moni.malviya@clinicdermatech.in"
	<moni.malviya@clinicdermatech.in>, "cd.ggn2@clinicdermatech.in"
	<cd.ggn2@clinicdermatech.in>, "cd.amritsar@clinicdermatech.in"
	<cd.amritsar@clinicdermatech.in>, "gmeditec@gilmdc.com"
	<gmeditec@gilmdc.com>, "digital.doctoriduniya@gmail.com"
	<digital.doctoriduniya@gmail.com>, "info@doctoriduniya.com"
	<info@doctoriduniya.com>, "callcenter.bangkok@mission-hospital.org"
	<callcenter.bangkok@mission-hospital.org>, "doctoriduniya@gmail.com"
	<doctoriduniya@gmail.com>, "clinic.arc.in@gmail.com"
	<clinic.arc.in@gmail.com>, "appleskin.skin@gmail.com"
	<appleskin.skin@gmail.com>, "info@medklaire.com" <info@medklaire.com>,
	"info@lifeessentials.co.in" <info@lifeessentials.co.in>,
	"online@lifeessentials.co.in" <online@lifeessentials.co.in>,
	"essex.fighting.arts@hotmail.com" <essex.fighting.arts@hotmail.com>,
	"care@bombayshavingcompany.com" <care@bombayshavingcompany.com>,
	"charu@bombayshavingcompany.com" <charu@bombayshavingcompany.com>,
	"razorpreneur@bombayshavingcompany.com"
	<razorpreneur@bombayshavingcompany.com>, "Career@bombayshavingcompany.com"
	<Career@bombayshavingcompany.com>, "Hr@bombayshavingcompany.com"
	<Hr@bombayshavingcompany.com>, "John.Doe@bombayshavingcompany.com"
	<John.Doe@bombayshavingcompany.com>, "Last@bombayshavingcompany.com"
	<Last@bombayshavingcompany.com>, "Doe@bombayshavingcompany.com"
	<Doe@bombayshavingcompany.com>, "LF@bombayshavingcompany.com"
	<LF@bombayshavingcompany.com>, "DJ@bombayshavingcompany.com"
	<DJ@bombayshavingcompany.com>, "First@bombayshavingcompany.com"
	<First@bombayshavingcompany.com>, "f}{last}@bombayshavingcompany.com"
	<f}{last}@bombayshavingcompany.com>, "jsmith@bombayshavingcompany.com"
	<jsmith@bombayshavingcompany.com>, "abc@xyz.com" <abc@xyz.com>,
	"contact@newlooklaserclinic.com" <contact@newlooklaserclinic.com>,
	"ranuncleclinic@gmail.com" <ranuncleclinic@gmail.com>, "neo@neolook.com"
	<neo@neolook.com>, "shailesh_14264@yahoo.co.in" <shailesh_14264@yahoo.co.in>,
	"parichay@newlooklaserclinic.com" <parichay@newlooklaserclinic.com>,
	"info@clinicdermatech.com" <info@clinicdermatech.com>,
	"moni.malviya@clinicdermatech.in" <moni.malviya@clinicdermatech.in>,
	"cd.ggn2@clinicdermatech.in" <cd.ggn2@clinicdermatech.in>,
	"cd.amritsar@clinicdermatech.in" <cd.amritsar@clinicdermatech.in>,
	"gmeditec@gilmdc.com" <gmeditec@gilmdc.com>, "drskbiswas@gmail.com"
	<drskbiswas@gmail.com>, "vasu@gmail.com" <vasu@gmail.com>,
	"info@vidushiagarwal.com" <info@vidushiagarwal.com>, "dr.vishal123@gmail.com"
	<dr.vishal123@gmail.com>, "vagrawal@delveinsight.com"
	<vagrawal@delveinsight.com>, "contact@drbatras.com" <contact@drbatras.com>,
	"info@drbatras.com" <info@drbatras.com>, "trichosmo@gmail.com"
	<trichosmo@gmail.com>, "Info@supremephysio.com" <Info@supremephysio.com>,
	"info@physio.com" <info@physio.com>, "customercare@supremephysio.com"
	<customercare@supremephysio.com>, "info@intercarehospital.com"
	<info@intercarehospital.com>, "saxenahosp@gmail.com" <saxenahosp@gmail.com>,
	"rajnoni@gmail.com" <rajnoni@gmail.com>, "bpratayksha@gmail.com"
	<bpratayksha@gmail.com>, "info@shreeslimming.com" <info@shreeslimming.com>,
	"sumitskin77@gmail.com" <sumitskin77@gmail.com>, "WEBcontact@dermawave.in"
	<WEBcontact@dermawave.in>, "contact@dermawave.in" <contact@dermawave.in>,
	"dermawavepanipat@gmail.com" <dermawavepanipat@gmail.com>,
	"ryu0655@hanmail.net" <ryu0655@hanmail.net>, "enquiry@almassaclinic.com"
	<enquiry@almassaclinic.com>, "a2zshows1@yahoo.com" <a2zshows1@yahoo.com>,
	"smhairtransplant1995@gmail.com" <smhairtransplant1995@gmail.com>,
	"aayatclinic2021@gmail.com" <aayatclinic2021@gmail.com>,
	"klantenservice@pipoos.nl" <klantenservice@pipoos.nl>,
	"info@gaurayurveda.com" <info@gaurayurveda.com>,
	"support-modicare@modi-ent.com" <support-modicare@modi-ent.com>,
	"support-modicare@modi.com" <support-modicare@modi.com>,
	"grievance-modicare@modi-ent.com" <grievance-modicare@modi-ent.com>,
	"customersupport@livemint.com" <customersupport@livemint.com>,
	"news@medigatenews.com" <news@medigatenews.com>, "jane.doe@modicare.com"
	<jane.doe@modicare.com>, "vxx@modicare.com" <vxx@modicare.com>,
	"nxx@modicare.com" <nxx@modicare.com>, "modicare@modi-ent.com"
	<modicare@modi-ent.com>, "support-modicare@modienterprise.com"
	<support-modicare@modienterprise.com>, "support-modicare@modicare.com"
	<support-modicare@modicare.com>, "harvestfamilydentla@gmail.com"
	<harvestfamilydentla@gmail.com>, "harvestfamilydental@gmail.com"
	<harvestfamilydental@gmail.com>, "hirdayanand-modicare@modi.com"
	<hirdayanand-modicare@modi.com>, "manglikelec@rediffmail.com"
	<manglikelec@rediffmail.com>, "jane@modicare.com" <jane@modicare.com>,
	"janedoe@modicare.com" <janedoe@modicare.com>, "JohnSmith@modicare.com"
	<JohnSmith@modicare.com>, "JohnSmith@timesgroup.com"
	<JohnSmith@timesgroup.com>, "info@modicare.com" <info@modicare.com>,
	"John_Smith@timesgroup.com" <John_Smith@timesgroup.com>,
	"customercare@lookssalon.in" <customercare@lookssalon.in>,
	"accaliaclinic@info.com" <accaliaclinic@info.com>, "drskgupta@gmail.com"
	<drskgupta@gmail.com>, "info@dermaspace.in" <info@dermaspace.in>,
	"info@ipalclinic.com" <info@ipalclinic.com>, "drsheherbano@gmail.com"
	<drsheherbano@gmail.com>, "www.facebook.com/@ELALA.Clinic"
	<www.facebook.com/@ELALA.Clinic>, "aphc@apollohospitals.com"
	<aphc@apollohospitals.com>, "rpsinghskin@gmail.com" <rpsinghskin@gmail.com>
Subject:
 =?utf-8?B?8J+MnyBQYXJ0bmVyIHdpdGggVGhlIEJlYXV0eSBCb3h4IOKAkyBZb3VyIE9u?=
 =?utf-8?B?ZS1TdG9wIERlc3RpbmF0aW9uIGZvciBBZHZhbmNlZCBTa2luY2FyZSwgQmVh?=
 =?utf-8?Q?uty_&_Training_Solutions!?=
Thread-Topic:
 =?utf-8?B?8J+MnyBQYXJ0bmVyIHdpdGggVGhlIEJlYXV0eSBCb3h4IOKAkyBZb3VyIE9u?=
 =?utf-8?B?ZS1TdG9wIERlc3RpbmF0aW9uIGZvciBBZHZhbmNlZCBTa2luY2FyZSwgQmVh?=
 =?utf-8?Q?uty_&_Training_Solutions!?=
Thread-Index: AQHb4B5VxuVWSbJU5kGcovifzgBysQ==
Date: Wed, 18 Jun 2025 07:01:10 +0000
Message-ID:
 <PN3P287MB3142792AA28F7B410764E746BC72A@PN3P287MB3142.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thebeautyboxx.co;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB3142:EE_|MA0P287MB0347:EE_
x-ms-office365-filtering-correlation-id: 807df6be-afe2-4da7-13ec-08ddae35e7ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|34036016|7416014|586017|376014|41320700013|1800799024|366016|10070799003|8096899003|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3FUSzlGVzRmenh6OTYyRG01Skl3UjRsZlVhMjlMcExOVis2Z3poUUZEVDNQ?=
 =?utf-8?B?SE85T1kwaHR4QXdrSmdYaVFsYWFiSTlhNEdPS1FDTTl4QlYyNUk1KzB6dHMy?=
 =?utf-8?B?S1NYdkhOZGFiUjBackNlVXJkeUhQc2x1U25DeEprL2dvQk1LanVaM05lNVEy?=
 =?utf-8?B?dDFCRkh3c1FFZi9CWENBMUVua2F4dy9PVHVXMmlWczhvMDNQUXB2QlAvQlFs?=
 =?utf-8?B?RkFDQ1ZWY0xGZlQwZXBEU01EMjBPNnh0dnk0YkdLOFBUWFV4eFdibkEycUI1?=
 =?utf-8?B?aEQ4bDBsSWg0ZUlRaGZ1TnFPbFFBd2gzQW9wcW9LaUdEc0x6NTZBdGY5Yk16?=
 =?utf-8?B?aW9DcG5nZHJ6OW9kK2ZOZXdLZDJOcVZ6b0tkeExBTHV6c1AwTVZIVzc4U0hn?=
 =?utf-8?B?R3VDbklYampxTXVuVFJkS1BKZ1VXUDdNclZVcUowM3QrMStOeVB4bmdRbk5H?=
 =?utf-8?B?dVh4ZnhYS01yaFd0ZlpmaUtjUnRFalNNdGtTbVIyZ3ZPRC9Od0VDcXY4dU5w?=
 =?utf-8?B?RmlRa2JMci90SitRdjVpNEhLYXNLZ2xYYWlUSWQ3NGRoRms1MEJXSGVBQ285?=
 =?utf-8?B?Y2NtNDhkVGduOTRIdGV2N3dhdDQwNFo0RXJFcVVHTzI5djVjVGhMbUR6dGd1?=
 =?utf-8?B?eGp1ZUczK1o2YVdQOFBxbVA1cXpYMkE4M05ueVE0R2J1anRVMGRtMG8yQzR5?=
 =?utf-8?B?Uk0rNXZmWVU2d3BzQnY1Szh5Z21nK2RMMmwzUkdYSnFXYk5EVGVmVXFqcWdm?=
 =?utf-8?B?bGpuSXlEVWZ6eXo2RTFIR2d5blNDL2o2eXZEaWgrdFhvTU5wQVYzbnFORTkz?=
 =?utf-8?B?NER6dGMxeW15a01HNlAvRDJLcTlhQUluZVh3UHdKakJIZS9ocUdHZDZ3Nkhj?=
 =?utf-8?B?dk1HbmVQaSs1SGZHeURpYzA4eVM0WEN2Q0owY1NiWk9GSS9CUzJOb3B5eXov?=
 =?utf-8?B?NG45RGxXcTVnY2k1dTNFRDRYdkh6ZXVuK1hRWXhINUlBQ3QwQWFHS2xENXhS?=
 =?utf-8?B?MStvZk91aFlPNFNGdXVyUUdrS2t1U3hhdTE2Y0JYOGJ1Rzcza1hBQit0bWZX?=
 =?utf-8?B?bEFERVlySE1EcWtkSzltNlZtQ0xKcWZuOEFMNENEK2JoYVh4c3h0SkxVTkl6?=
 =?utf-8?B?eEF0djgxN1ZCZDVxWExBQ0UyalpKNGx5aG5hclR0VG12eFduQjRrRlR0d2lG?=
 =?utf-8?B?NllpQXdCR0RhcXZBNGJIUmtrUDBXYVlTM283YUo4K1ZtcUlvU2k5K3BKVnNx?=
 =?utf-8?B?N2lwUWwrTE1uZWhqM0lTRjZKaU5VN0RzMTRSdkRzZzQzWmpiYytEZmphcUEx?=
 =?utf-8?B?b21JMkpJS3AveW5UdUs4Rjc4TVJNNHR6SXkySU1WNHlFcXpMcjJPS1VXLzZR?=
 =?utf-8?B?Q1FqTFdDcC93Si9ueS9JWDNCejFUQnh3bnFjcERiVFBQS2lSMVgyYzNYa2JR?=
 =?utf-8?B?ZVcxbVVQQjN6SmNabkx3MTJVU2NFRFNIZXJRbkVoNzM2WlRGRjh5eWhyV1lC?=
 =?utf-8?B?cUpDdVJ5NTZKb1ZmYVJhL3dlTDZSNGJsdXBaQzI0bFRVaDl6cnhVOGo0WGFH?=
 =?utf-8?B?SXFWUXhTQUtrNG1nbTlFbU9zaU5OU0JQekRlRW1SK0RQeVRYRGhSazV6dHNa?=
 =?utf-8?B?TDZsV2pVNDBVanhtUVlGWUNrTHpvVHhqRUlIb3ovVGZ6YUhIRXBrWTR3eUhl?=
 =?utf-8?B?Ym9jN3RRbSt0YU0vbzl4S3E0Yi9td3lhQ3ZsamlvbmhiRlU1cEVZTXJiNWpJ?=
 =?utf-8?B?cW9MdDdjUWhBYUMvSGxQZEJneWV4TlVMcmw5a2dhOGV2Rnpxc3Q4Zk1LWE1T?=
 =?utf-8?B?NjVZM1NuZlZEU2I1TkUybm1vZ2dJTlgzeXd1RmNhblRkaTBtMUdHVDRidURo?=
 =?utf-8?B?Q1UrTEE1WCtUL292NW14bkt3TTRJeTRTNDh2MURpbC82Q1lMcVh5eDRhOXFZ?=
 =?utf-8?B?OVBDN3NiYmIydVNGVTBPb0FhUUhlVlQ1dk41b0JXSzJuanVOa1B6S1BzV2sy?=
 =?utf-8?Q?PjGUIL1YiSBeboCbbNKoGePtiJOO38=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3142.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(34036016)(7416014)(586017)(376014)(41320700013)(1800799024)(366016)(10070799003)(8096899003)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YkNDcUF0M3ZhamU0dHplSEw4MXFBQk5EMTk3TmtUNXZhb0pxY1N1czdUallj?=
 =?utf-8?B?TE02UWxuTC9EWVkvbGlYYkVlMXQybUdOYkJFcDkwUU5JaU12TXBzL2RRT1NV?=
 =?utf-8?B?dmIxTlp6N0dpK0UwelRpUzhQWWhNWE5HMTBGTUV0UGMrWXBQdU5ISzVmOGZ1?=
 =?utf-8?B?SHp2RGhJUWY4VlM2Q3QxbHNnSUNhL0xIZ3dBb2h6NStteWczOUM1UXVPSVBu?=
 =?utf-8?B?UTdHTFRZZ1QvNytFUCtrTzEwQnp5OVU5a1QxV2w1TW4yMnF2Tko0ZDVRdzJQ?=
 =?utf-8?B?UkNBWWVqZVRvdTdEMDFWS0Q4WHAzVzVVQzNlTVhHZncxWVpmYndHYXg3QVlr?=
 =?utf-8?B?elhvenE2ZE9jQ3hLM0NtVWlRQmVBZEY3bWxTQ1dkbmR0dys3ZnFXcDV5S1Yw?=
 =?utf-8?B?RGdOanBrNDMzWmxtRHN5S1grMGFxSFpLSkNHdTJ5cWJJZ2NRK2pBUVF6cU9L?=
 =?utf-8?B?cWw3RGhkLzlFZTZIcERaNk1VYkJxRDlIdjg1ZFdUNkpNcWVBdU9mRzBnVjFP?=
 =?utf-8?B?UUFRZ0QvSDJNU3gvSFFWTkQrVGxkQUw1Qk1UTWp0SDJaekdXK21rQ1lzMmMx?=
 =?utf-8?B?a2lqTE9NaCsyQmN5KzJUeTFtQS9xcHpBMVdDek1yY2pTc2tmanJ1OTl3Tzcw?=
 =?utf-8?B?ZUtSenVORElzcHdSYkkzcng2cVhUN1piMHI4aWVQcVROZHNPTzlLd0ZPWXhG?=
 =?utf-8?B?K29OQk9WUTRScHNJUXFWT1JqYVdOWHUxVTU0dEVCalgvTFc3R2RXZDgrSUF1?=
 =?utf-8?B?LzhzTjFlNU5qSGlOeFNLN1Q5Y3ZjbjlKc1Y0WHFzQ0N5aCthNUVMbHVraWhk?=
 =?utf-8?B?cHJTbEZDSTRxLzdJemRPUjFNSkVzcmxSYlVSRTJaZWlzd1hpWmJQMnpWTW9C?=
 =?utf-8?B?QnJEaHUyWXBzd2FDTkRqY2NTako1YkM4alNwNjIvdGdBYnpDOFBPbkxVeE12?=
 =?utf-8?B?L0hneDUrdkZKaW1PWTRFVkJKRzIxYjdaMlRYVnNOZURWWUxmbUc1emVlMTYv?=
 =?utf-8?B?VUwwUEFjSlJGbFY2NnJNckQ0dExKMTlHTXFXTC9QRE5FNWJsMGdCeVQwMlI0?=
 =?utf-8?B?bnd2US85SlFzR0pLTHVDSEJIRktIQlNzaXZ4TThBeTB2UTRHOWJYWDN4NU1x?=
 =?utf-8?B?OE1FRzRCcC9QcmF3ZERVWXVyYkFqQzFrODc0YnNacTVmL0hyM0JpS281bWdL?=
 =?utf-8?B?Q3lQc25yR2Z0eEY2TWo3NnFPUkhObTgvSjdKaDRRQk9PRHhreVhnTklIM3Aw?=
 =?utf-8?B?SnRUWWExZVlkNGM2N05zZXFJNll1STV5TTlrT2JrSzJBQ25TZUN4eDRPRHMr?=
 =?utf-8?B?MWpIVWMwZ0F2R0lFYlFaZTVZOUh2djZLdEZ4RTlFSDZ3T2Q1SVE4SEtPMlYv?=
 =?utf-8?B?cnVoTVR5R3VxTUppZ1pZWEN3NmdQVm9xdmRjNmt3VEkrcCtXSkp1OVVoamtL?=
 =?utf-8?B?OEIwMEw5RmNwUy9WYitFTlhscm0wMkpkTENVbTRZcVZvNjBPVlhINGZIQ2I4?=
 =?utf-8?B?MmNmbE54eGk1UWt4c00vYUdEREpWMW4xNjZuRTBXMVNVb2ZXcWp3MVQrNWVW?=
 =?utf-8?B?Wm0zMzdpT1B4WG5OTnJheHUvbHZ3TkdJWDhyVTYxS1k5Vkp4N3U4Q0MyTTlt?=
 =?utf-8?B?MEQ5b2x2T21UaDNVUE9idXVBRzdTdVFTTHgwZU9tU1g4LzBRcnNCdk5kbXZx?=
 =?utf-8?B?c0lHeTRDZTRTZElGMTZSVzBUMGhiNUNCdEJtZkxGZFFLV05Bem1ZUG1jdHRV?=
 =?utf-8?B?VTUyM2pUbEpZOW9tVzZhWW0zSmpyRTU2RHBRd3BsUTZFMFgvcWlGTUt6c1p4?=
 =?utf-8?B?UmVVTW9reTZ6ZUFxSjJ2eE9ROERFK1c3N043dHl4Tk5kdllVeGpJbVlCUXdZ?=
 =?utf-8?B?NWlxcjJqaVhxS3U0M3cwdVp0WHVlZ2RCVzZVZGRKaUFxQmNUMEsxQTd5NitP?=
 =?utf-8?B?WVl5UDdyQW1hUUMxeWJCVjFHR1h0enBUNVJFUGY2bC9MOExHN1BvdU9SM1I3?=
 =?utf-8?B?TCtOSXp3MWxkYzRKVzY5TGcyeSs0N240dnRzSklrUDBMM0c2RnlFZUNLdUxU?=
 =?utf-8?B?NEtxQlBWMmpDNzFsWktQaGtCcEtMckJZcTVqaHBrZUw2RWt2QVhJNVNFMHRJ?=
 =?utf-8?B?TW5wY0VsTUJseDFyTVZUT1VlbmZTaTluQjlyYUxoTmU4cGZDeGxtZkxSVmZX?=
 =?utf-8?Q?I6WccbwM2hshwHtVVglL4d8fp2Wmm4E1ZYnyZFtp1490?=
Content-Type: multipart/alternative;
	boundary="_000_PN3P287MB3142792AA28F7B410764E746BC72APN3P287MB3142INDP_"
MIME-Version: 1.0
X-OriginatorOrg: thebeautyboxx.co
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3142.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 807df6be-afe2-4da7-13ec-08ddae35e7ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 07:01:10.3599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 955239e0-76d2-440d-b6b9-57d8b170ec58
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+ofSEAWghw/O3YGvFLmdps6oh4awGTPXZ2EJxiNkj8/vYpVjZRPphHReOhTn2ATAiU1ea/ncW2eb6fcN0zDDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0347

--_000_PN3P287MB3142792AA28F7B410764E746BC72APN3P287MB3142INDP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpIZXl5IGJlYXV0aWZ1bCBzb3Vscw0KDQpHcmVldGluZ3MgZnJvbSBUaGUgQmVhdXR5IEJveHgg
4oCTIEluZGlh4oCZcyB0cnVzdGVkIG5hbWUgaW4gYWR2YW5jZWQgc2tpbiBjYXJlLCBiZWF1dHkg
c2VydmljZXMsIHRyYWluaW5nLCBhbmQgcHJvZHVjdHMhDQoNCldoZXRoZXIgeW914oCZcmUgYSBk
ZXJtYXRvbG9naXN0LCBzYWxvbiBvd25lciwgc2tpbiBzcGVjaWFsaXN0LCBvciBjb3NtZXRvbG9n
eSBleHBlcnQg4oCTIHdl4oCZcmUgaGVyZSB0byBlbXBvd2VyIHlvdXIgYnVzaW5lc3Mgd2l0aDoN
Cg0K4ri7DQoNCvCfjL8gT3VyIFdpZGUgUmFuZ2Ugb2YgTWVkaWNhdGVkIFNraW4gVHJlYXRtZW50
cw0K4pyUIEh5ZHJhRmFjaWFscw0K4pyUIExhc2VyIFRyZWF0bWVudHMNCuKclCBTY2FyLCBUYW4g
JiBQaWdtZW50YXRpb24gUmVtb3ZhbA0K4pyUIFRhdHRvbywgTW9sZSAmIFdhcnQgUmVtb3ZhbA0K
4pyUIEFkdmFuY2VkIENoZW1pY2FsIFBlZWxzDQrinJQgRHVsbG5lc3MgJiBBbnRpLUFnaW5nIFRy
ZWF0bWVudHMNCg0K8J+ShSBOb24tTWVkaWNhdGVkIEJlYXV0eSBTZXJ2aWNlcw0K4pyUIE1hbmlj
dXJlICYgUGVkaWN1cmUNCuKclCBIYWlyIFNwYSwgTmFub3BsYXN0aWEsIEhhaXIgQ29sb3IgJiBT
dHlsaW5nDQrinJQgUHJlbWl1bSBIYWlyY3V0cyAmIEdyb29taW5nDQoNCuK4uw0KDQrwn6e0IE1l
ZGljYXRlZCBTa2luY2FyZSBQcm9kdWN0cyDigJMgVmlzaWJsZSBSZXN1bHRzDQpBbGwgb3VyIGlu
LWhvdXNlIGZvcm11bGFzIGFyZSBkZXJtYXRvbG9naWNhbGx5IHRlc3RlZCBhbmQgdHJ1c3RlZCBi
eSBjbGluaWNzIG5hdGlvbndpZGU6DQrinKggRmFjZSBXYXNoZXMgfCBNb2lzdHVyaXplcnMgfCBT
dW5zY3JlZW5zDQrinKggS29qaWMgQWNpZCwgTmlhY2luYW1pZGUgJiBWaXRhbWluIEMgU2VydW1z
DQrinKggRXZlcmxhc3RpbmcgR2xvdyAmIEZvcmV2ZXIgWW91bmcgU2VydW1zDQrinKggUHJvZmVz
c2lvbmFsIFNoZWV0IFBlZWxzIHwgRmFjZSBUb29scw0KDQriuLsNCg0K8J+OkyBDb3NtZXRvbG9n
eSBFZHVjYXRpb24gd2l0aCBTa2lsbCBJbmRpYSBDZXJ0aWZpY2F0aW9uDQpXZSBkb27igJl0IGp1
c3QgdHJlYXQgc2tpbiDigJMgd2UgYnVpbGQgZnV0dXJlcyENCkJlY29tZSBjZXJ0aWZpZWQgd2l0
aCB1cyBpbjoNCvCflLkgSHlkcmFGYWNpYWxzIHwgQ2hlbWljYWwgUGVlbHMgfCBMYXNlcg0K8J+U
uSBJbmplY3RhYmxlcyB8IEJCIEdsb3cgfCBQUlAgfCBNaWNyb25lZWRsaW5nDQrwn5S5IEhhaXIg
JiBCZWF1dHkgQ291cnNlcyBmb3IgQmVnaW5uZXJzIHRvIEV4cGVydHMNCg0K4ri7DQoNCvCfkqEg
TG9va2luZyB0byBFeHBhbmQgWW91ciBTZXJ2aWNlcz8NCldlIGFsc28gb2ZmZXIgdG9wLWdyYWRl
IGVxdWlwbWVudCBmb3IgeW91ciBjbGluaWMgb3Igc2Fsb246DQrwn5K8IEh5ZHJhRmFjaWFsIE1h
Y2hpbmVzDQrimqEgSVBMIExhc2VyIE1hY2hpbmVzDQrwn5KhIExFRCBMaWdodCBUaGVyYXB5IERl
dmljZXMNCg0K4ri7DQoNCkxldOKAmXMgd29yayB0b2dldGhlciB0byB1cGdyYWRlIHlvdXIgc2Vy
dmljZXMsIGluY3JlYXNlIHJldmVudWUsIGFuZCBjcmVhdGUgdmlzaWJsZSB0cmFuc2Zvcm1hdGlv
bnMgZm9yIHlvdXIgY2xpZW50cy4NCg0K8J+TqSBSZXBseSB0byB0aGlzIG1haWwgb3IgV2hhdHNB
cHAgdXMgbm93IHRvIHN0YXJ0IGEgY29udmVyc2F0aW9uIG9yIHJlcXVlc3Qgb3VyIGZ1bGwgY2F0
YWxvZ3VlLg0KDQpKb2luIGhhbmRzIHdpdGggVGhlIEJlYXV0eSBCb3h4IOKAkyB3aGVyZSBiZWF1
dHkgbWVldHMgcmVzdWx0cyENCvCfk40gUEFOIEluZGlhIFNoaXBwaW5nIHwg8J+MjSBHbG9iYWwg
SW5xdWlyaWVzIFdlbGNvbWUNCg0KV2FybSBSZWdhcmRzLA0KVGVhbSBUaGUgQmVhdXR5IEJveHgN
CvCfk54gKzkxLTYyMzkxMDI1NjggLDczNDczNDEwNTUNCvCfk6cgaW5mb0B0aGViZWF1dHlib3h4
LmNvDQrwn4yQIHRoZWJlYXV0eWJveHguY28NCvCfk7IgSW5zdGFncmFtIC0gdGhlYmVhdXR5Ym94
eDgNCnwgRmFjZWJvb2sgLSBLYWphbCBSYW5hIHwgV2hhdHNBcHAgLSA2MjM5MTAyNTY4DQoNCg==

--_000_PN3P287MB3142792AA28F7B410764E746BC72APN3P287MB3142INDP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxicj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRU
b1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFw
dG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpIZXl5IGJlYXV0aWZ1bCBzb3VscyZu
YnNwOzwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxl
PSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vy
dmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkdyZWV0aW5ncyBmcm9tIFRoZSBCZWF1dHkgQm94eCDigJMg
SW5kaWHigJlzIHRydXN0ZWQgbmFtZSBpbiBhZHZhbmNlZCBza2luIGNhcmUsIGJlYXV0eSBzZXJ2
aWNlcywgdHJhaW5pbmcsIGFuZCBwcm9kdWN0cyE8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRU
b1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFw
dG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpXaGV0aGVyIHlv
deKAmXJlIGEgZGVybWF0b2xvZ2lzdCwgc2Fsb24gb3duZXIsIHNraW4gc3BlY2lhbGlzdCwgb3Ig
Y29zbWV0b2xvZ3kgZXhwZXJ0IOKAkyB3ZeKAmXJlIGhlcmUgdG8gZW1wb3dlciB5b3VyIGJ1c2lu
ZXNzIHdpdGg6PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBD
YWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIg
c3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0Zv
bnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJw
dDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4ri7PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50
VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBB
cHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNs
YXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1i
ZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K8J+MvyBPdXIg
V2lkZSBSYW5nZSBvZiBNZWRpY2F0ZWQgU2tpbiBUcmVhdG1lbnRzPC9kaXY+DQo8ZGl2IGNsYXNz
PSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRk
ZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4pyUIEh5ZHJhRmFj
aWFsczwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCuKclCBMYXNlciBUcmVhdG1lbnRzPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50
VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBB
cHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4pyUIFNjYXIsIFRhbiAmYW1wOyBQ
aWdtZW50YXRpb24gUmVtb3ZhbDwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0
eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250
U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7
IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuKclCBUYXR0b28sIE1vbGUgJmFtcDsgV2FydCBSZW1v
dmFsPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJp
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0K4pyUIEFkdmFuY2VkIENoZW1pY2FsIFBlZWxzPC9kaXY+DQo8ZGl2IGNsYXNzPSJl
bGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRG
b250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7
IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4pyUIER1bGxuZXNzICZh
bXA7IEFudGktQWdpbmcgVHJlYXRtZW50czwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJv
b2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3Nf
TVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCvCfkoUgTm9uLU1lZGlj
YXRlZCBCZWF1dHkgU2VydmljZXM8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBz
dHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9u
dFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrinJQgTWFuaWN1cmUgJmFtcDsgUGVkaWN1cmU8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQrinJQgSGFpciBTcGEsIE5hbm9wbGFzdGlhLCBIYWlyIENvbG9yICZhbXA7IFN0eWxpbmc8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQrinJQgUHJlbWl1bSBIYWlyY3V0cyAmYW1wOyBHcm9vbWluZzwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVk
Rm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlm
OyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0K
PGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuK4
uzwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTog
QXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJm
b250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2Vydmlj
ZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9y
OiByZ2IoMCwgMCwgMCk7Ij4NCvCfp7QgTWVkaWNhdGVkIFNraW5jYXJlIFByb2R1Y3RzIOKAkyBW
aXNpYmxlIFJlc3VsdHM8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZp
Y2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+DQpBbGwgb3VyIGluLWhvdXNlIGZvcm11bGFzIGFyZSBkZXJtYXRv
bG9naWNhbGx5IHRlc3RlZCBhbmQgdHJ1c3RlZCBieSBjbGluaWNzIG5hdGlvbndpZGU6PC9kaXY+
DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K
4pyoIEZhY2UgV2FzaGVzIHwgTW9pc3R1cml6ZXJzIHwgU3Vuc2NyZWVuczwvZGl2Pg0KPGRpdiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0Vt
YmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuKcqCBLb2pp
YyBBY2lkLCBOaWFjaW5hbWlkZSAmYW1wOyBWaXRhbWluIEMgU2VydW1zPC9kaXY+DQo8ZGl2IGNs
YXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1i
ZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4pyoIEV2ZXJs
YXN0aW5nIEdsb3cgJmFtcDsgRm9yZXZlciBZb3VuZyBTZXJ1bXM8L2Rpdj4NCjxkaXYgY2xhc3M9
ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrinKggUHJvZmVzc2lv
bmFsIFNoZWV0IFBlZWxzIHwgRmFjZSBUb29sczwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRv
UHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0
b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuK4uzwvZGl2Pg0K
PGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxi
cj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWls
eTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJy
aSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwg
MCwgMCk7Ij4NCvCfjpMgQ29zbWV0b2xvZ3kgRWR1Y2F0aW9uIHdpdGggU2tpbGwgSW5kaWEgQ2Vy
dGlmaWNhdGlvbjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250
LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwg
Q2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4NCldlIGRvbuKAmXQganVzdCB0cmVhdCBza2luIOKAkyB3ZSBidWlsZCBm
dXR1cmVzITwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZh
bWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2Fs
aWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2Io
MCwgMCwgMCk7Ij4NCkJlY29tZSBjZXJ0aWZpZWQgd2l0aCB1cyBpbjo8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrwn5S5IEh5ZHJh
RmFjaWFscyB8IENoZW1pY2FsIFBlZWxzIHwgTGFzZXI8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1l
bnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQs
IEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9u
dC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrwn5S5IEluamVjdGFibGVzIHwg
QkIgR2xvdyB8IFBSUCB8IE1pY3JvbmVlZGxpbmc8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRU
b1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFw
dG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1z
aXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrwn5S5IEhhaXIgJmFtcDsgQmVhdXR5
IENvdXJzZXMgZm9yIEJlZ2lubmVycyB0byBFeHBlcnRzPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250
LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZv
bnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2
IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3Nf
RW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K4ri7PC9k
aXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRv
cywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBD
YWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJn
YigwLCAwLCAwKTsiPg0K8J+SoSBMb29raW5nIHRvIEV4cGFuZCBZb3VyIFNlcnZpY2VzPzwvZGl2
Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3Ms
IEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4N
CldlIGFsc28gb2ZmZXIgdG9wLWdyYWRlIGVxdWlwbWVudCBmb3IgeW91ciBjbGluaWMgb3Igc2Fs
b246PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJp
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0K8J+SvCBIeWRyYUZhY2lhbCBNYWNoaW5lczwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxl
bWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9u
dCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBm
b250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCuKaoSBJUEwgTGFzZXIgTWFj
aGluZXM8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGli
cmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQrwn5KhIExFRCBMaWdodCBUaGVyYXB5IERldmljZXM8L2Rpdj4NCjxkaXYgY2xh
c3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJl
ZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQriuLs8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGli
cmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAs
IDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHls
ZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNl
cnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBj
b2xvcjogcmdiKDAsIDAsIDApOyI+DQpMZXTigJlzIHdvcmsgdG9nZXRoZXIgdG8gdXBncmFkZSB5
b3VyIHNlcnZpY2VzLCBpbmNyZWFzZSByZXZlbnVlLCBhbmQgY3JlYXRlIHZpc2libGUgdHJhbnNm
b3JtYXRpb25zIGZvciB5b3VyIGNsaWVudHMuPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Q
cm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRv
c19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6
ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGNsYXNz
PSJlbGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRk
ZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2Vy
aWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K8J+TqSBSZXBseSB0
byB0aGlzIG1haWwgb3IgV2hhdHNBcHAgdXMgbm93IHRvIHN0YXJ0IGEgY29udmVyc2F0aW9uIG9y
IHJlcXVlc3Qgb3VyIGZ1bGwgY2F0YWxvZ3VlLjwvZGl2Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRv
UHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0
b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNp
emU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFz
cz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVk
ZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkpvaW4gaGFuZHMg
d2l0aCBUaGUgQmVhdXR5IEJveHgg4oCTIHdoZXJlIGJlYXV0eSBtZWV0cyByZXN1bHRzITwvZGl2
Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3Ms
IEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0
aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4N
CvCfk40gUEFOIEluZGlhIFNoaXBwaW5nIHwg8J+MjSBHbG9iYWwgSW5xdWlyaWVzIFdlbGNvbWU8
L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFw
dG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2Us
IENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+DQpXYXJtIFJlZ2FyZHMsPC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50
VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBB
cHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQt
c2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0KVGVhbSBUaGUgQmVhdXR5IEJveHg8
L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFw
dG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDAp
OyI+DQrwn5OeICs5MS02MjM5MTAyNTY4ICw3MzQ3MzQxMDU1PC9kaXY+DQo8ZGl2IGNsYXNzPSJl
bGVtZW50VG9Qcm9vZiIgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRG
b250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7
IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiPg0K8J+TpyBpbmZvQHRoZWJl
YXV0eWJveHguY288L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9u
dC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2Us
IENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjog
cmdiKDAsIDAsIDApOyI+DQrwn4yQIHRoZWJlYXV0eWJveHguY288L2Rpdj4NCjxkaXYgY2xhc3M9
ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRl
ZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJp
ZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQrwn5OyIEluc3RhZ3Jh
bSAtIHRoZWJlYXV0eWJveHg4PC9kaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiIgc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRT
ZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsiPg0KfCBGYWNlYm9vayAtIEthamFsIFJhbmEgfCBXaGF0c0Fw
cCAtIDYyMzkxMDI1Njg8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0i
Zm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZp
Y2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_PN3P287MB3142792AA28F7B410764E746BC72APN3P287MB3142INDP_--
