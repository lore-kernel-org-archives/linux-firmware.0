Return-Path: <SRS0=rtOn=ZT=quicinc.com=quic_smagar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63820C54EE9
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 06:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D628C433D7; Fri, 16 Sep 2022 06:54:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB2C5C433D6;
	Fri, 16 Sep 2022 06:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB2C5C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5sp3J011234;
	Fri, 16 Sep 2022 06:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=lNZf9ZEq6fiScBiwWBy1JLsOUqRxCzGJwef1Usuzocw=;
 b=D4Q0eNiPGiCkNdhf1vLj1ecP2Ql1rw5wcJC/v6iklry7pRMgKVRaTlyXKbewkeLGbGF5
 otL+L9F0idxz9fInpPMsQZ5cSXUXRoCgmQScspP1sIMkdRM3/XL+WAvcnEo6f4PdaHlo
 JW+sarTqYrtou8banY/cRIHmjeVtdlnuR+DARe1O61xAY90/XHj/67Ezxe08kEDKCHx2
 Whi/SJw/WvsLsRiuEhdQqY8VS4X71wxFu9px2rSalCXO01qogGN3BK+eM/at2pmxkoE+
 B3TvmwQG+EEydMB8zjwuGLlmi8BepcRe7uBd+eZujTTR9DES7viOlh88ltKyoeWv/V2c nA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jm90shp2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgJTcxeGQ3s7PFinZoUo4EQ3sllsv0QgQ3lm0Cf0ba5WAiBJYFRGEScs9UFFwffJspaV/FsRJeW/i8ckQ9GRp7NvQKkYPj/i3wTDe0sYsf/+qcXoxkOx6N53Zy0GqC385UGG2TVaFrzRqx7u5ckjhMUj3LVNjwU0nbh0K4X+fwVhKrfJDPuYAgemwHDFk3ZDARyX4ZmRq3jc17yjGSyhESrMbR9mPBEGqjxZEFDshM+byxgxhl0xkthHvt5otOJBKgB+5QfTzLik9OQG8wpE6K1Ljpk5PtqZXWv0DR5LOtHNnKe/QBKfgjBPawfbs5JwygoXiStNXK87f70V9zSv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNZf9ZEq6fiScBiwWBy1JLsOUqRxCzGJwef1Usuzocw=;
 b=Om2Ys/u95FcpAEuKP3LBZASlqAPE583W/ZmNt7jSk1NXWu1asSEt7xFZCBkuTooXfSfsrm4QGAfqKGybi3JJZxO4k5cyMpIG/BFRu4RGOrIvqksqjUb6udNByVjNE4wgLwBqJP7d9JMe5zow/PJCFKgfz3EpIle9VmVNlYA1gm1JkOlXVBPvtp1aQ58+T2aM1wZsmpolbyq6/xNF5FDwIYG0Fg18NDar/AgnGOdF/mb89pB205NzXjLSlWIGUrHMh7L9jiFBx5aG9dNlIysMAuo6IJtAJcA5uZTbqIFZUskR23hGVPckNeyE8gIdNkP8VJG0qFxem3HQfldIh+9wmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB7943.namprd02.prod.outlook.com (2603:10b6:8:14::18) by
 BY5PR02MB6517.namprd02.prod.outlook.com (2603:10b6:a03:1dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 06:54:48 +0000
Received: from DM8PR02MB7943.namprd02.prod.outlook.com
 ([fe80::6803:f65f:5043:23a]) by DM8PR02MB7943.namprd02.prod.outlook.com
 ([fe80::6803:f65f:5043:23a%3]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 06:54:48 +0000
From: "SURAJ ASHOK MAGAR (Temp) (QUIC)" <quic_smagar@quicinc.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "Balakrishna Godavarthi (QUIC)"
	<quic_bgodavar@quicinc.com>,
        "Sai Teja Aluvala (Temp) (QUIC)"
	<quic_saluvala@quicinc.com>,
        "Atul Dhudase (QUIC)"
	<quic_adhudase@quicinc.com>,
        "Sampath Nimmala (Temp) (QUIC)"
	<quic_sampnimm@quicinc.com>
Subject: qca: Update firmware files for BT chip WCN3991.
Thread-Topic: qca: Update firmware files for BT chip WCN3991.
Thread-Index: AdjJlfiAvcjn/tJrTqyLjAFWwmKZ2A==
Date: Fri, 16 Sep 2022 06:54:48 +0000
Message-ID: 
 <DM8PR02MB794335113A0327A554F7F3BAF9489@DM8PR02MB7943.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB7943:EE_|BY5PR02MB6517:EE_
x-ms-office365-filtering-correlation-id: 354707ee-7001-46d5-1801-08da97b058db
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mOWG8+bJuDiqI54RukfwO0yiI9ldBfqHqeby9x1kvIQR6W46lAX8QUiGe9Wa0WhwsXRi6TdpLMgT5vxgLkDSxyYD8T6PP3foTP8jXsnBYc+BYJw5UdL4S9LUH6dOY//kNCZjoFCq6Z83XbaR8K5lkTC2jg2UpoLXqlj3XqJM5iqmK6knNsNfYgrNheGoQp3XBw6NZqpwXubqowwQVOZ858HExmHd8IcMlReteoWi6NC8QDevbVCWMmKe0l1jE047XLTKucutlkezMdUWlCl5h+jPxgRAkb5gIVRS79sXNZkQ8o2iCmLtE3xmE6F4OQf9gUtM2h9Pfc7d1jmxwwJw8P0rPO7l4XQ+moi1MwaHE7mBdvrJwIh4LK16+UOSGWEvKasy7qcS4pgWY/JVADMPRkWdPLv6+Iaz4yZBhRF26tTKLBM6tj3AT4AH6nK+sAddNYNclU4d6Q+jmr0wtXfUXwUGSJxA/dVrxn5sXqc39UcCmEBu1oogTF52qdjQNgm0vCmqltkhVnXnJGxtXGeA0NdOHS2wf5V0LPAXhSTRWhCIQf/eDRoGQLen4wZOn1GtdcvQnIS+jdaBHvt5fpZR1MydE7f6QNbgK++8Hik87rPvwFreGx6n+Qzf1Ybk7SB6IkDidrfVrGb8CGPHSO0ohc+DrwHaNQcUGs1bDPsyS2JrSpETuT0/npW4RMoBBskbesLnRMjdPpVli5E46SSLQYH0eDib6DOY+Xcmcj+SuhBShcJCykSsgj4l3KQbH7azY+eFgtHEw81TWM3wW1ErO8PZysaJORjdJqgKq0Z6vu4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB7943.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199015)(41300700001)(9326002)(8936002)(2906002)(86362001)(55016003)(66946007)(66556008)(76116006)(4326008)(64756008)(66446008)(66476007)(33656002)(8676002)(83380400001)(7696005)(6506007)(26005)(9686003)(6916009)(316002)(38070700005)(54906003)(107886003)(5660300002)(71200400001)(52536014)(15650500001)(478600001)(186003)(38100700002)(166002)(966005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WZqam1bvLZBbPBBiZrwXORzv3kFsjSEJY0xsYZjg/vV/76kV0QPhfKH5gmGf?=
 =?us-ascii?Q?xojcw7MmPtN1VDJ7J89d43WrLZtb3G/ZV2dbN5zmNK/AHAfCXtf6NywTOJ/S?=
 =?us-ascii?Q?oqahwMO7KEfGnTTLT9jjlUdtiYIAjiwSeYYw1ZBEWteG72yTXeKly8QpblVU?=
 =?us-ascii?Q?uOpWDF0VY6FL4ADHwagYnY4XVQAktfgIiQsDeHpChxD8cNGydh5tk5UbI3dO?=
 =?us-ascii?Q?DJ4PUwAEPwep3RxHVILHqMRjh4xdbo1Os1OwO7bH8GDS3itf1U5ncJAKmBzd?=
 =?us-ascii?Q?fKgphTfCWlV8MOtpAAvnycKtICHNewoddVngXlTA3kb28zH99exVfIpq0P4a?=
 =?us-ascii?Q?M90ICR+7p1d9upqClPL1FREynafsUxjN1AAwc/kDlQeKOBL7qBOGHR2xkvnt?=
 =?us-ascii?Q?Od5bHV+yJWp3F63RdnbfP6QmQE3q1hG447+KIEEuHmdPEWuR0XIxBlwfs/L+?=
 =?us-ascii?Q?JVnAjLCYRdMyxOUzn5hfyzDqBqA99PI3SQKPEvgxAmn4T0r+8hynxlpt7nuZ?=
 =?us-ascii?Q?5s7su8Ln4jp9pJFLoyjTvN+CbaRHOZVH9adJC6pQHhC+1kCIzG0oqS6oYbfT?=
 =?us-ascii?Q?0+3F85qGDHKO1J+NqxMfgAo4jyR0AtIRAkm49r7c/bzIbPNcyL9paZkX4iHz?=
 =?us-ascii?Q?6M7eMM7M7YZVRHgYfBUBHkJpCE9q7qXmuyAm11G+3ja4maN86X/DgIpG8VNQ?=
 =?us-ascii?Q?vBoaSGCQY2ulpAl4XD6lrN0GBSRGq+Ni4+qjtS6xImAQDZ6Q3ux8r91eQthi?=
 =?us-ascii?Q?kQ0lf9Z0nn4QDDxC7Jgb1Ezb801xmvh+S0szvTnb7lHksYEnvpqOFNeJB6dA?=
 =?us-ascii?Q?vddU0y2XUVlnhvDHePxZnDS5rJ+n8aek/mTKEK41A+2uoHzCO1WTM1n3L7Yc?=
 =?us-ascii?Q?ZWU24UL6GtJwDU4v2fnuiPW8UV7er5+exqf00QMvJnMQOU1BEJyy+5PCVffR?=
 =?us-ascii?Q?MKk1dlkN4yI7EKJ4gLO+NZ/udcFUPCcS5x8TurTd6AiZ/wKjiAt7Ymq4QwN2?=
 =?us-ascii?Q?OUFfXmHAMI6fkbzauAaqHLZwvvFLGXZMuHKi+417iQeubaMs7go+sdCsn8g9?=
 =?us-ascii?Q?j3l7CghMy7tDsXN2OZDV8p/6lp8Ptmoldd7IZyaxM/7xsy5Yy66OzUuxLFW9?=
 =?us-ascii?Q?DJyR5aPS0qwMKfe7yesqXtIgy8lgHOUJo6r9uPDNZ7aUXWvTAakwedQEqRWY?=
 =?us-ascii?Q?KQ4QGaAtCGF7kb964ySDCwbBbg31xUYBoccPXObTNiWFOFr+Yh47kStnOOof?=
 =?us-ascii?Q?JxgFbu19mIRUSG87b8s0EE4QQVBgDmH/mfRjDfv0gGE20YzKlyMvyLLFvIC0?=
 =?us-ascii?Q?S61renhZW0JNgAkW5W17t7dnoxZYDH7GUaMNdv0ZwnFFI+mrofyxOaVz18rV?=
 =?us-ascii?Q?OAr66QaeQG93stqaEn9pbcstUmlZkknvuXc/zVPt9lWLTT/SS8ltS5JfDq3N?=
 =?us-ascii?Q?aYyedS/LpjvWTHbzhCCLWp1mSiaCpUT/35ETLtZHMcKblXNJ4eXLhZfEwgu8?=
 =?us-ascii?Q?z7ZJplrkq2LrgkwdGbVkaL2lE8sZR64tNNB9mQEbfR6bCTLW1NxYgTjpWQT7?=
 =?us-ascii?Q?IoUW7Pzt6eJ8w+60vR6/Do2ND3/ZSXTGo7wq2ZAn?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR02MB794335113A0327A554F7F3BAF9489DM8PR02MB7943namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB7943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354707ee-7001-46d5-1801-08da97b058db
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 06:54:48.6513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwCanK0VGzIkXGd9GVAdAMMQs44jlJGExQpeqWNCH5y8Pj2/KJauaFb3LMpALlxu4i3lOehmiMHFvjibxE1vCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6517
X-Proofpoint-GUID: RKb_k2NgL_WQ_yf9L7m6qxeV22Kd0aZv
X-Proofpoint-ORIG-GUID: RKb_k2NgL_WQ_yf9L7m6qxeV22Kd0aZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160050

--_000_DM8PR02MB794335113A0327A554F7F3BAF9489DM8PR02MB7943namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,


Please include firmware bins for WCN3991.



Changes includes updated firmware files with:

     *   BQR enhancements
     *   LE priority changes
     *   Braktooth issue fix
     *   RSSI Fix

Snapshot of pull request is as below, let me know if anything is missing.




The following changes since commit 3593bb7d8f6f18c442a6b0b3f3d43e4d5d7fc2be=
:

  Removing crnv32 (2022-09-15 11:09:50 +0530)

are available in the Git repository at:

  https://github.com/suraj714/Bluetooth-upstream.git main

for you to fetch changes up to 0e8f546c4c66a61981fd0341ec0a84563d1cfaaa:

  qca: Update firmware files for BT chip WCN3991. (2022-09-16 10:44:17 +053=
0)

----------------------------------------------------------------
Suraj Magar (1):
      qca: Update firmware files for BT chip WCN3991.

qca/crbtfw32.tlv | Bin 126036 -> 117664 bytes
qca/crnv32.bin   | Bin 0 -> 5407 bytes
qca/crnv32u.bin  | Bin 0 -> 5407 bytes
3 files changed, 0 insertions(+), 0 deletions(-)
create mode 100644 qca/crnv32.bin
create mode 100644 qca/crnv32u.bin

Regards,
Suraj Magar.

--_000_DM8PR02MB794335113A0327A554F7F3BAF9489DM8PR02MB7943namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:374162674;
	mso-list-type:hybrid;
	mso-list-template-ids:-579053832 -1 67698699 -1 -1 -1 -1 -1 -1 -1;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:763191902;
	mso-list-type:hybrid;
	mso-list-template-ids:-586528322 67698699 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Please include firmware bins for WCN3991. <o:p></=
o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Changes includes updated firmware files with:<o:p=
></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoPlainText" style=3D"mso-list:l0 level2 lfo2">BQR enhancemen=
ts<o:p></o:p></li><li class=3D"MsoPlainText" style=3D"mso-list:l0 level2 lf=
o2">LE priority changes<o:p></o:p></li><li class=3D"MsoPlainText" style=3D"=
mso-list:l0 level2 lfo2">Braktooth issue fix<o:p></o:p></li><li class=3D"Ms=
oPlainText" style=3D"mso-list:l0 level2 lfo2">RSSI Fix<o:p></o:p></li></ul>
</ul>
<p class=3D"MsoPlainText">Snapshot of pull request is as below, let me know=
 if anything is missing.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit 3593bb7d8f6f18c44=
2a6b0b3f3d43e4d5d7fc2be:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Removing crnv32 (2022-09-15 11:09:50 +0530)<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"https://github.com/suraj714/Blueto=
oth-upstream.git">
https://github.com/suraj714/Bluetooth-upstream.git</a> main<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 0e8f546c4c66a61981fd0=
341ec0a84563d1cfaaa:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; qca: Update firmware files for BT chip WCN399=
1. (2022-09-16 10:44:17 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj Magar (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Update firmware =
files for BT chip WCN3991.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qca/crbtfw32.tlv | Bin 126036 -&gt; 117664 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/crnv32.bin&nbsp;&nbsp; | Bin 0 -&gt; 5407 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">qca/crnv32u.bin&nbsp; | Bin 0 -&gt; 5407 bytes<o:p><=
/o:p></p>
<p class=3D"MsoNormal">3 files changed, 0 insertions(+), 0 deletions(-)<o:p=
></o:p></p>
<p class=3D"MsoNormal">create mode 100644 qca/crnv32.bin<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 qca/crnv32u.bin<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Suraj Magar.<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR02MB794335113A0327A554F7F3BAF9489DM8PR02MB7943namp_--
