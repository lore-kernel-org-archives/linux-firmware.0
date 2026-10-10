Return-Path: <SRS0=mxeZ=IA=crepuse.com=founder@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66787CA6017
	for <linux-firmware@archiver.kernel.org>; Sat, 10 Oct 2026 12:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31C8B1F00893; Sat, 10 Oct 2026 12:56:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.76
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791636988;
	b=XVwfXnDHQdB6vuyaQaiP3ew/f913b9608XYtzQJyQY/BiVsmM+2hfpGV+jqhdlpLdMho
	 vxlMe1OX93l54JkHp2x2Lf45WmcBfxWFBOZyIpEVttihk381GltX1qcK0Hmwp9ty+Z47e
	 mPJKLdGQgAalvozH1jsMePh2CS10E8xJtA2gjrnntkZfKMKsmBiltHzyB5yVOJ2dCrG9E
	 0aM+mn81Nvr1meKKEwh45OTz8+fpVoboKr0jDqSvuLsy3q+m1mnCk6SGEpE08WjmeJBKX
	 j4Oe9axv1t+7FGueMCZ1wt3OpKpI6BYICOyVy40OPxAWfb9+8SGJd8NzkLABELYBHbQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:List-Id:To:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LWzE3jFdAdz8gq4dwEfhUo0E7dOYQ0nlY3ZEbxqoffk=;
	b=Bb082rec/XATX62K8HbklXxEpBpu3F4iqOe6GYMw+/Rd/iL5RlzTwEEksavtSc5lFRau
	 nIvqhV+PDr8gkavpTz8PLso5x/np+I0QRSH6q/ppGPe9oeD8I+8Y7JeRhSqndgKwEsYQI
	 bLuNbSLi6ZQZLbu3WiACTDASQ6DlGrXCENyR2ZifuulDBezvUPeFnIbKAJc58FNJ4L+bN
	 VIRJ1/2f3K0W8vFnCrli7aB+VVRcLpX75tcJpBumlZlCcAOgy2YVdiXHXzRLuKsVF451b
	 Qd8Ecm3bY4k6qZv0vCUqz+qKnokOAwbWoYlrJqotSWuHGMNtOvXzG8sBX3wIK2K+32w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=crepuse.com header.i=@crepuse.com header.a=rsa-sha256 header.s=selector1 header.b=Q25NFjPK;
	dmarc=none header.from=crepuse.com;
	spf=pass smtp.mailfrom=crepuse.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.76
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022076.outbound.protection.outlook.com [40.107.75.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 674DC1F000FF
	for <linux-firmware@kernel.org>; Sat, 10 Oct 2026 12:56:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crepuse.com header.i=@crepuse.com header.a=rsa-sha256 header.s=selector1 header.b=Q25NFjPK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 674DC1F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=crepuse.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBW2B8NPhzFJqnCSY9X1g0PPWKhuNLAAa6sr+VSD4CpsxsXinKM6xVpiJtY5AS2orzWF9QYtbYlFEOIQ8m+v0iVyCh1Zn/XVjaoaR+k0aj9icag2lS93O6229v4sP6KZaGgQsZJ1dBRMCKsUlu2aKkpL82rswV4PGsAg08X5lYSOPwQK8RWPrdGMsk5Vf0x7ryat321YHl8h4I/nwUqLqWaVOFv9QkRIE1HoyBM/pcY8Q2bAKz8nTgRZymUUDvdjSVP2/3KzrrpOecDyKcoWU+B4GkRaIEr+dHnNxQeS27SAD2vniXUqJjYg2BF6oJl/NDaP63XP3FuHIdkM/VFBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWzE3jFdAdz8gq4dwEfhUo0E7dOYQ0nlY3ZEbxqoffk=;
 b=ETe7Ah2jSNcJmr3/1YR55TFi4sRqF5GfFvz2Dyo7L4Mfj4nDGWw2rQRWafJGl0wjqkPeSa3yw3oQlGgL3ulfzUQrwcxjuLYZehOesZ2/NJedDAUDkhNHk2XGoGaOVOfOkVSFZtmtLEoFR+21GrVmGGEvMXkegZdk5VgDjwcdqAZdIhkF85NqpKweR4rLY9E7aOd1KQVCucINR3LUZGpy9rM7GK2JfVD8lk/p3U+JYo/J7SDXX1taMiKBNINIU48K4bAnF0/92ZmWfbV72otShwi1ZWPJVq+X2U6OG3LFDBREvAk132M7tTdSOHTfq+Bm6t2qDQeJo/G32+KWY19TKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWzE3jFdAdz8gq4dwEfhUo0E7dOYQ0nlY3ZEbxqoffk=;
 b=Q25NFjPKhKgU1qztRuwU7lC456kyg1fYhspOEV2CHtjHnu5dun9edrg/LlJaEDDSQBBzcnlR8DGReHsHv9MknfD/+e3H2bvb0Lj54OIhOEaceeMQII9RATazB6zdVlYBpw9ggW0FEHNttzyWarTw/4xX27GSOAU2uqXpPnhsiw/H4CZDyEqfSjAjBvQruwtMjv9bFVQcC/D20ywRUcWhVd+rSB/dW5zvVgIfDb6z6/Jx3SggRL0kucDVt5vgRJThusjRir0leXtcthk+JyGBuKk/6IGt0UEH87jvel/88K1RUTLDK5NzEPNT9673VZZ5WcH5poB60DhhXIE1+t62nw==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by SEZPR01MB7751.apcprd01.prod.exchangelabs.com
 (2603:1096:101:2a5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 12:56:25 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 12:56:25 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Question about vendor acknowledgement for GPL-derived MIPI DBI
 firmware
Thread-Topic: Question about vendor acknowledgement for GPL-derived MIPI DBI
 firmware
Thread-Index: AQHdWLbBaDj/x24pDk2zZMTILooXwQ==
Date: Sat, 10 Oct 2026 12:56:25 +0000
Message-ID: <F3A6CFD2-EE4E-4DC9-B05E-7BD3A3F6295C@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|SEZPR01MB7751:EE_
x-ms-office365-filtering-correlation-id: 28ff5a85-2bea-4ff0-be3c-08df26cde45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|18002099003|3023799007|38070700021|5023799004|56012099006;
x-microsoft-antispam-message-info:
 DrJwG6+V5hNERxOhPfm8DrVTZFACzqwvbrXM9PRQWBdHAXbVIL4oWGfJneTGCAViBYrcKe90Q2xMazu8NTzJKyWAcFz+t0G/PTZwUqzirDykp6cVTW9BGqU31RbaQETBh3yvQ6DwZwNQdSIhlUjYOpUEyeKeRFXBC8USaMlKBBOdkYyLbztue791UHeyXH11A0ILaf+KUgx/V1HSRl5SVcUfwlr9KLBRQQuW+TmLAvlsG49exAUdr7MumaVgWNiQdq0bvr28UEmwkfWej/FPcXswpZLRdyMl49choxIZSd4Cxymn6RVoXR1gqa5BYar2KX2MkDSJ4zxDZpiAe61gseHZiilfW9SNANcK6Mwy6suqlavkHwncZ7Tp/VJkKLEqoUY/ruVjXHUQCMx0y+JrA8RkyQHxQJBGngGKeaGi0gj+wjrT67CDr4aQGEJyTWhSDL1pFNjRNMTRFMcx/bvwijEjtpvxFeIQf+4cWUAcTxPolAe6PwEJSYoh1GJjJcH8sfnK9LG4zGi01QUc1EoLAyYXko9WV40NP80GpMFZAbTNUufp8N4+aw27Kby3UNCaxVFB0tUaEB2ICgfPPlHVWhqugnFPoAV0jQLXSRdecbShz2CRP4shYiUe4n4tsS3Kf9iCSbr8NIpMa4qvSrSvUVqJWKZqbhOoAGfVbdvSmaDfgtbzCdThQeaRwD4I3AjN/dNxtXVDoXdfbStRoMPLNTjfnJfbwpfRnXClwQk4VSQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(3023799007)(38070700021)(5023799004)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AOm12u/ssZnFqT+Ox6snVT8IpSbZmRUZe8fXXYOQp8pcc9J1+Hdz4RIo/xry?=
 =?us-ascii?Q?4AaI+95dv4PFnhastjgogLX9LjlBp2gNXP2AOMhjS4EdoQ4dqB/mUZ6/cgGE?=
 =?us-ascii?Q?e3th74JtXvwSDi+blK2d67N+Iumzbl5zKfLLohBAf0akXr8JVGvdEbBD1miw?=
 =?us-ascii?Q?Mo1B7Bwsiy+Q3elSbOz+/YgllE/vWQDprlNkJaX8ge33ij9sCyQ3wZkoqGdE?=
 =?us-ascii?Q?1TndDbfJyej+fM9ByX9eZfSx969M3Kb4kco1yCwVbihwVyXLGoez72JdrVxa?=
 =?us-ascii?Q?nL4p9nx1qMxbDhZLadzhlHzrW3PlW9FzB41eaqMZgToI4eI2ffiMZFZ3BpuT?=
 =?us-ascii?Q?WqAVmC+lge3+PEv2Z65BK5v4N6n6XuLs+GlUv9k3eDekvdN3FNKRKa4WSTYk?=
 =?us-ascii?Q?Gdx57gfJkoQs9DJnbD7njKnrkb8Nb36haBU0qbAEE/UzfRAKondHOjhGMnL7?=
 =?us-ascii?Q?V/I3bAJmLF53MII57aFBW/gTWJ+57lfzgtHeNYlduKKGaG9Ft+L0zn8Hw/V4?=
 =?us-ascii?Q?CcMtAPcfAcpWKvsKJMNp277Gn3MQjNX4XEu9YjkK4JjFSBaKs6IsfswY5jhl?=
 =?us-ascii?Q?RZL5iASdhsXIpoZjjk1GxmqtGsk+siAbo3I5xmGYZps80pxqnZoC/2imD+/l?=
 =?us-ascii?Q?8KeuAVcE9d3omMZsfSheQiosOlaFt0DSkLAQzWEwap8CsS79ttSsW0N0gG+J?=
 =?us-ascii?Q?SqG/sja7qjiYQb/veuchF+Ld92MfnFLkMEmimPyc40OOcq5/DGtuDhvJdWQe?=
 =?us-ascii?Q?yKbkzDOlNW+WNQ59kshvn7Ro1/GpfpmqWqipmxy4BsgvY2gKEEeLfO7cl1I5?=
 =?us-ascii?Q?GbvfRJdJxhnt60oE3XeezEr2YHqvw68zpuntTQy7ndgBsjNKvxyWDhV0PVom?=
 =?us-ascii?Q?1QQj/UKQYnspkPTupfvjunXAmfpyzNDr4qovx36crRimtPyGxiwEpb3aONNe?=
 =?us-ascii?Q?KS+BYj77UZZRKGgMIlFf3rUiijXMpbZIfN4H5D1bCWy5WagswMAsAxtBUvpA?=
 =?us-ascii?Q?UorrkGrbORJYAHcgx+7v0OhCr87W3Mkrwo6gXM+Me7aMPavzCjEy4qdx7o03?=
 =?us-ascii?Q?9JUPxEOlULU4pwuAw2TRo+lM/js//l8st43epHpkTFy9FBXfN37u+oETPcat?=
 =?us-ascii?Q?bLXiTbxmOTLZljt7N9J3Yo2FQCNxWd5eVAfVVp1PuTPMhgjq0LzR1hsgMNhB?=
 =?us-ascii?Q?CMSBe8ilBI2vVy8u6Ov4h2i9GMwi7VcGddM7lbtftyR4oRzhoiinegIMoHKI?=
 =?us-ascii?Q?caRIr5BbKPuV+OdBBOr36HnU1bRof4F07xAjRrb2PfBeanV4mEUKylhlK5TM?=
 =?us-ascii?Q?/hosXLD/U9h+Ll/iZ9b9o05m/3nAsPRDJFEtnWsx7HRSPcFIYwPmpoi/0aP6?=
 =?us-ascii?Q?lQCwtheynL5CM/CrFOK/d/B50lh2ehJVQLWfQyvL0hKzUCNRtn+6lb/R4PeW?=
 =?us-ascii?Q?XJ56sigr3CWbOL219NNeJc4FqvIjvYPea2J+L/9hClGMASwKfl160mfkSFk5?=
 =?us-ascii?Q?ug6MBOFYp6DgiOizktDlSgr4VJx+9+3f6Ht+5xxEEG6KZpsxs/xP75rVo5uR?=
 =?us-ascii?Q?BobW9uLyuQTuMTFFwFuj/Yknps9mcg7+GT+K4/wZ/DCzstbbjC77RcE2EFuQ?=
 =?us-ascii?Q?lZMpfao+LyQ1Xsyp1RV13y+PTgbPjYQFHJrC5X/pgcC8B92sMZYLHHUpqOyI?=
 =?us-ascii?Q?ieUOUWLM9z+OoQt7DIIGOnqAbeli0H9dGnfYLUd7V3d+OcB8z/VoKGeBlVd+?=
 =?us-ascii?Q?uBozkWCmsg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A742D601E3866438D2895F1BEA2252B@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ff5a85-2bea-4ff0-be3c-08df26cde45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 12:56:25.0990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAtEyMA5P9sNX9a09shDtRilhb+4ZXsBUfSlDaW9RxpwmyIOcWoifsatmfd3dF6Y69d+h3x2LDbMi03LAY3Jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB7751

Hello,

I'm working on mainline Linux support for the DFRobot UNIHIKER M10,
an RK3308-based development board.

The board has a 240x320 SPI display using an ILI9341-compatible
controller. I've successfully tested it with the existing
panel-mipi-dbi DRM driver, without any driver modifications.

The panel requires a small initialization firmware file containing
MIPI DBI register commands.

Unlike typical proprietary device firmware, this file is generated
from an initialization sequence in the existing GPL-2.0-or-later
Linux fb_ili9341 driver, with additional panel configuration.
The generation process can be published in full.

I'd like to contribute this file to linux-firmware, but I have
a question about the vendor participation requirement.

Since this is a reproducible initialization command table derived
from existing GPL-licensed Linux code, rather than a proprietary
binary provided by the hardware vendor:

1. Would such a contribution require vendor acknowledgement,
   even when the original GPL license permits redistribution?

2. If vendor participation is required, would acknowledgement
   from DFRobot, the board manufacturer, be sufficient?
   Or would it need to come from the LCD module manufacturer
   or the original code copyright holder?

3. Would a submission with full source, attribution, and
   GPL-2.0-or-later licensing be acceptable in principle?

I'd appreciate any guidance before preparing the submission.

Best regards,
Mizuno Miotsuki
