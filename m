Return-Path: <SRS0=lEL/=AB=quicinc.com=quic_sampnimm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D0EC76196
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Apr 2023 08:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98E3FC4339C; Mon, 10 Apr 2023 08:31:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24C9CC433EF;
	Mon, 10 Apr 2023 08:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24C9CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33A7trqX008589;
	Mon, 10 Apr 2023 08:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=9OvJmDG4O1BdGljn+4m8COBcLiMrLA3ROswbsqSU8MI=;
 b=XQIpNYpk6mnWEnL1N5+mNEg9VJoQoc9F3mz7j1GrADvBHSUtWH6ZwOKzxrfDoQU+Cv1b
 JWPAz1Dtgv2rPnKaSlSL6571UJyCs14ZxFRegv8FRi0cB3HBiNQoYPiTSaxpYWqvxNRY
 hnfUpyIb+L2d80br2rDNbMiF2ZIRMr7DRamIm8NcTFtdZmCwb6EDWGnJCSVBjNH1ZeZq
 v9w8teUE5ybcZZtsGWv+kUqS0YExF5Mf1O32LwNxJ+M5qYZB3TOSPQEP+/MtGXfLN50P
 nwaKQMv3ChmfuV5knlF/iU2fgVpAvaLAbA2+TIMLNzPP9PUX52F6U+3F4xzatNwEiFU4 IA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pty9h2jjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Apr 2023 08:31:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lecyk4m0rvAjEYyWx2pG4Sgwcc/kIPADI/U4qPAXqoEHKBy2OYz6xIcChKoq/1iYbO4S7kZPEqq8I2bWOCuiLlIWd3avCQ5A43LxdrAdY79gIminWI25PBorG3Y4dgU0QcoTzLE3avUFgdQLpqt7PKQacZugZIkkgBR+TZDBaISd/rpv53SvUPnEx4byDG1L1RWs5W8H4fn0Q4dzF0yf346B1SGywxszZ2HVIoBY54ZfCyqO0o9ABr/mQJB0iznqrw8ZkMX5V5yG1AtgoAWP7ynuxryFQ9SXgTQULIT35XmV+gz1gSPoNAiyk8sr/S0Ke7w4rQs7XOI2DDcwJyxbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OvJmDG4O1BdGljn+4m8COBcLiMrLA3ROswbsqSU8MI=;
 b=TDDiUlTLsQy2kz1Qql+dHcpooik1VvEfoIFv5AIdiHW/TwZBGCVggqRnzn14y0v8lFNFK5jBf+usJTUNN2fQwMwazQv1mXxGHs9CiTvc1+9u5w1oL3KofSNs2b0b5yJlzRGZXY+wn58kjpAmNrBq59xttbl70lkAbZunk0fRoWzGxQ4bAw/AUBbpt9LwscuagY/48SCin1UWjThwyz57+sU1z2OkIAt5zUVmdGuWCmO5tQK0smqihFYBhKvWSHY7ZZBKaL28DuEi60DkzECpHT6IwUYmSb788x9cxPss6/onRw+mXwZP5igb8jQAyxQUlD+mcS1Mc2x4FxwGWHHibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from PH0PR02MB7542.namprd02.prod.outlook.com (2603:10b6:510:51::5)
 by CH0PR02MB8152.namprd02.prod.outlook.com (2603:10b6:610:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 10 Apr
 2023 08:31:08 +0000
Received: from PH0PR02MB7542.namprd02.prod.outlook.com
 ([fe80::2a31:c337:533:d22a]) by PH0PR02MB7542.namprd02.prod.outlook.com
 ([fe80::2a31:c337:533:d22a%4]) with mapi id 15.20.6277.034; Mon, 10 Apr 2023
 08:31:08 +0000
From: "Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
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
	<quic_adhudase@quicinc.com>
Subject: QCA: Update firmware files for BT chip WCN6750
Thread-Topic: QCA: Update firmware files for BT chip WCN6750
Thread-Index: AdlrhqwquThZG/j1RNyFxNupIEGPrQ==
Importance: high
X-Priority: 1
Date: Mon, 10 Apr 2023 08:31:08 +0000
Message-ID: 
 <PH0PR02MB75428BF5CB96C4533A0ECD79FA959@PH0PR02MB7542.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB7542:EE_|CH0PR02MB8152:EE_
x-ms-office365-filtering-correlation-id: 91971898-d52e-4a99-c3f4-08db399deeca
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 V81D3NgwYfLjhwMQKZJ9aFwwWJyHk1qvz/0RMSzss+Tzx7qagN/Z4doS23nHm1HUei5vqJ5hTpg+qO+Jw1ZHueBeT1S4nTmDsBatbdNM8b6Rk4f2gMRidDkowjhBnhJKDi44Kw4n2vofzb+eJZsiA3ItKVtBRG/QvP112wyynHLGyKWFXozzFCJBrnuuwAkn0E4+GVuAMd5hhky/Ydq3FjojALmiNpo3ze0n62iYYR7FJW6zIhtoBRM/r0WRmZAEuPV5FANTNXRHisIdzfOGOxcZ9E6g5CJr7maeISJgTtI4TLq/lLvJTFJMaS5gMKE3zQpFCpN8lzIb48VazYwU9GWW4LXdzB4jdgqLl70Ve2iQYxyQ5ec0skfv4oBtUyik/mYv5bBs1CbAkZ5ZkKkIYxbc+wPc7ItihU2r84+NDToftg5X1UOkizUf61zBl5CRK6uXXH3LuUg+klzcksbpmgl6i8C8UT01PaniXn63IOoYjaY1r7MgMdlwLmxqjUoLAlvUsO3nLWJBHnegrIcF8HL/krablSzC8HDNof6F0xmecTJOphEdHDcuMXmsffizEUF82wwrSaHAb0s61M0vGggRHbEkukprO6KxGvwZYQ0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7542.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(7696005)(71200400001)(478600001)(86362001)(55016003)(33656002)(83380400001)(122000001)(38100700002)(38070700005)(107886003)(966005)(2906002)(54906003)(316002)(186003)(9686003)(6506007)(26005)(66476007)(6916009)(41300700001)(66446008)(8936002)(8676002)(66556008)(52536014)(166002)(64756008)(9326002)(15650500001)(5660300002)(4326008)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DC/mgK+56eqme5CO6t4MK2jGop1l5tBgdB1Lq+H2dk+ic19sC1GL4Z+yks9h?=
 =?us-ascii?Q?8jwluUTqmGprVMLdarM50XDfzBtjCJRsy+D9iLJJjXZCKdPzbG15m5wwefTg?=
 =?us-ascii?Q?LA0bHWmhRiv4yL1cK4h/IBFvuzb/vFLdioVtY7rqRCTBwQ7YgZwNKL+yyqOd?=
 =?us-ascii?Q?c/i/G2Gg+GlGN1syHjZuYECzAUT6JQO+AdGndqRSJLpkoLir5AAgS+Oopoz9?=
 =?us-ascii?Q?2jbGdFtcWUfwnAxSuNbjzfHXCwIIUWOqbiRhQilRTNS9mBwWD/ZR8/Dve6ny?=
 =?us-ascii?Q?BmYeNor4QrjkR7oVcFMGrJ9KhcOF2aZ9p/zNApbV4fuvoEGGbs+p/zHWCcvH?=
 =?us-ascii?Q?G5zLbnwnLiL/qJ6cZYHHW1IMEU782lNorlneRca0FDqrY43RRLTq2q9AcEpp?=
 =?us-ascii?Q?9mPy6RBEeKfVZ9D0KOsIokFlqwaRXvTQfjbIMQLdtJYIM7EyeoR2gHBKTcXE?=
 =?us-ascii?Q?OA75KUVs/45y6SJqKtIWpWFzGg3u8mjInnfM6yJqBCJP4fibr8uZMvAmAfW7?=
 =?us-ascii?Q?C76KPICh9mZvKTlRUDDRez2doN9oz+LoHnJlFJ35lDNgrRnwePDBwu4RnAwB?=
 =?us-ascii?Q?gF+BgZf5u9T9veiZ9BcqADay4GxQhfapXP1OrTR9Xh2CYScO2cuksJF2JUMp?=
 =?us-ascii?Q?05avVBGkT7S6AwovKm60VFh7VqmvEQmqX8iX2lwuuGwjjJ3WVGOJ7hpzPwxM?=
 =?us-ascii?Q?gZseivXGKwJoL5G99Ezv1tJlCPJeH7f846+jkjkX8KDAd0frFLwgkshAe02M?=
 =?us-ascii?Q?Ai8SFa28hry1zUU+qyzljUDJUSi02WMDEd7vtCV/RqCGSR49eQ9RYdyCI6cR?=
 =?us-ascii?Q?v19xtLk+iMZ+8A9RQkfvrr6DrBVEH4EUOJhVNju0DB0z56Ci1ORBKIVKmiqw?=
 =?us-ascii?Q?i9Nz0BBLUXeFyGAtf8hsAmV9RxUfSpJF7e/Vx434qndK+yQl9RNjEfcTQQtN?=
 =?us-ascii?Q?GE7PEJiG7bDolQkzhzmerbOCjgtRfJjoBER5xCVoSPQozykU4zn4575Mc58b?=
 =?us-ascii?Q?JEuTyM0XmlWKwdzpCDLNYN+PlLNaoP8V9eKh5k8K7XtHkPra3kNh0hlNmOMy?=
 =?us-ascii?Q?Z6jU1uTwOP7z9F6t0oHtVdZXrhpXoBEeAw8cfZLmwoPSAZVkGSfLnHhTeXC8?=
 =?us-ascii?Q?FNJ6G4mhxsaJprJ7SoNnMXHhghPT3WnzIA9D7jTitWDugtfuryTvSZC1xaH/?=
 =?us-ascii?Q?inJR/2E5JcIaf4eTDHFALjCK+g1gZqV3VIAynzXOqE/ul8Afc5aPw88y0pKC?=
 =?us-ascii?Q?8akiUpUbrrZpUC1l1YkcfuRf4xz/SiZJTTS2NI6iwWvOhN8iebn0lSn4y6lK?=
 =?us-ascii?Q?fIRiSmllld9E/vv15it2ZhBgy+2aS5rHsddw2DzWbV3KlDoXK294GNOXKMO6?=
 =?us-ascii?Q?XCQ7eTjtmZl/oM1KGs5XD82U6WZ6MS6zK0KNfZ52bKgO5dskhzDo5CgLzd86?=
 =?us-ascii?Q?TplN24vtPrJ6jYYZNTzEmFAozMSXOgn9i/UTLlAjKbREKYzdEh9RpPx7qQWT?=
 =?us-ascii?Q?uxUUzfzOsjv0Ln/ebSOYZNQ8TaF9Hocp709Ab9Yacp3H91/3wYCoGwctcV8Y?=
 =?us-ascii?Q?0e/p5VvzoN5/aHoOPPdO+Re6N3lkAsbJ03LkGlMW?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB75428BF5CB96C4533A0ECD79FA959PH0PR02MB7542namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vyKRH0vDMG8LyDEB8h2w9+s0MBsSCwwa0D6i44ikAF6/nNIELTjldJIPVIEd1B2Ski14GraQlRSdE0JRRtFcr6kKbVpIfCnCrB4fsOCnnTj8q44c8QH8lsTqDn8+4TunCUEObxabBqO1gegciZdNcPkHojDyXUM9IG/bsQGtUdbHQ8OHoydBg33VB4u4xtxTk0CrUgQVCV7tU12LSaE76PJVMOe7sgr2ZhhYH8qPFIwXA1dbR5CEhJkTz0PpHzEUwQW9JTs2rUKJtrpeG3qK9Y4Vk7eHa8Ap5Siej1fNjUQvA33M4wbrxoBm/0UmrOtAwR6dPuLL7qMzehcnEwf5P4qYsxkdd2eA3+P3DurycjyjLXz0VJlshWdIhI4NxtGnbz2eT+SfzKgBVUpG08+8mctm+y13bNMwa6qsF6RPaNN5Vbcy5pozJkzyp6HXyBm1BkYioZel10VPuuSIfv9nmMqP6nMmNH+Wn0UoAcgpmJ4zS+kVU09jRykWJ+lcpzqbz9VOtQt8O6Afz+OMqWiNp2M9XZtj+SIXAtbDk27exKRjtT+euZ5WvWsuhZvnKAlvp4JEAk0yry0wLuehU7pfU9hDjd/TozZjRMkiq3/a6WU1dOS876H4aJ8pOPhlj6pkg5tfHdFGnTjpbBjtxZGJZxAwlbrrIfcZrCbOYvx9WRyKQvs7mL1WZ0jKdj5Tl0d+X45AxjePPYFO6DCg+qxuPZrnQmEycxkIZw3SLyN2QxTh4VE2Z7xaoGZvQTlh2kEsXiQLFUYeah98kTmPeg4KAyzVaHG4mIdJvAmdI59qZxFBYaeEdPI67HBFHYdsUIFqpd6CQW0ev1GUAOlnylUv7Q==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7542.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91971898-d52e-4a99-c3f4-08db399deeca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 08:31:08.1774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXpC1eazYrW49M4C6/UZRWsIaVYZ1zYbpqZs/+Jxkcui0kFTQqJxQV3aSJwqQLxeC5+uGP7qNOsesG5/AJDw64eopt5nEPC83KY5JGanCYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8152
X-Proofpoint-GUID: 9bd4iiEQIv-Fy2QcvgsccOrhD3oSXz26
X-Proofpoint-ORIG-GUID: 9bd4iiEQIv-Fy2QcvgsccOrhD3oSXz26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=789 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304100073

--_000_PH0PR02MB75428BF5CB96C4533A0ECD79FA959PH0PR02MB7542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Please include firmware bins for WCN6750.

Major contributions : Bug Fixes.


Snapshot of pull request is as below, let me know if anything is missing.
---------------------------------------------------------------------------=
------
The following changes since commit 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00e1=
:

  Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31 -0400=
)

are available in the Git repository at:

  git@github.com:sampathnimmmala/Bluetooth_FW.git<mailto:git@github.com:sam=
pathnimmmala/Bluetooth_FW.git> main

for you to fetch changes up to 167ab8853bc15f8ec58e6b76f98ee5007770d907:

  qca: Update firmware files for BT chip WCN6750 (2023-04-10 13:55:38 +0530=
)

----------------------------------------------------------------
sampnimm (1):
      qca: Update firmware files for BT chip WCN6750

qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes
qca/msbtfw11.tlv | Bin 154624 -> 155340 bytes
qca/msnv11.b09   | Bin 0 -> 5847 bytes
qca/msnv11.b0a   | Bin 0 -> 5847 bytes
qca/msnv11.bin   | Bin 5847 -> 5847 bytes
5 files changed, 0 insertions(+), 0 deletions(-)
mode change 100644 =3D> 100755 qca/msbtfw11.mbn
mode change 100644 =3D> 100755 qca/msbtfw11.tlv
create mode 100755 qca/msnv11.b09
create mode 100755 qca/msnv11.b0a
mode change 100644 =3D> 100755 qca/msnv11.bin
---------------------------------------------------------------------------=
------

Thanks,
Sampath


--_000_PH0PR02MB75428BF5CB96C4533A0ECD79FA959PH0PR02MB7542namp_
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
	{mso-list-id:1902986409;
	mso-list-type:hybrid;
	mso-list-template-ids:-2081663220 67698689 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please include firmware bins for WCN6750.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Major contributions : Bug Fixes.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Snapshot of pull request is as below, let me know=
 if anything is missing.<o:p></o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
-----------------------------<o:p></o:p></p>
<p class=3D"MsoNormal">The following changes since commit 86da2ac9b4e57e9a8=
8f8bfcb5a163a406f5c00e1:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; Merge <a href=3D"https://github.com/pkshih/li=
nux-firmware">https://github.com/pkshih/linux-firmware</a> (2023-04-06 07:3=
0:31 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"mailto:git@github.com:sampathnimmm=
ala/Bluetooth_FW.git">
git@github.com:sampathnimmmala/Bluetooth_FW.git</a> main<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 167ab8853bc15f8ec58e6=
b76f98ee5007770d907:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; qca: Update firmware files for BT chip WCN675=
0 (2023-04-10 13:55:38 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">sampnimm (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qca: Update firmware =
files for BT chip WCN6750<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.mbn | Bin 166836 -&gt; 167552 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msbtfw11.tlv | Bin 154624 -&gt; 155340 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.b09&nbsp;&nbsp; | Bin 0 -&gt; 5847 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.b0a&nbsp;&nbsp; | Bin 0 -&gt; 5847 bytes<=
o:p></o:p></p>
<p class=3D"MsoNormal">qca/msnv11.bin&nbsp;&nbsp; | Bin 5847 -&gt; 5847 byt=
es<o:p></o:p></p>
<p class=3D"MsoNormal">5 files changed, 0 insertions(+), 0 deletions(-)<o:p=
></o:p></p>
<p class=3D"MsoNormal">mode change 100644 =3D&gt; 100755 qca/msbtfw11.mbn<o=
:p></o:p></p>
<p class=3D"MsoNormal">mode change 100644 =3D&gt; 100755 qca/msbtfw11.tlv<o=
:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 qca/msnv11.b09<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100755 qca/msnv11.b0a<o:p></o:p></p>
<p class=3D"MsoNormal">mode change 100644 =3D&gt; 100755 qca/msnv11.bin<o:p=
></o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
-----------------------------<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sampath<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PH0PR02MB75428BF5CB96C4533A0ECD79FA959PH0PR02MB7542namp_--
