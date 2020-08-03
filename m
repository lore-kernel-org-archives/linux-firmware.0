Return-Path: <SRS0=ivhD=BN=nxp.com=ganapathi.bhat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34781C433E3
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Aug 2020 12:30:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 242E32054F; Mon,  3 Aug 2020 12:30:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A992086A;
	Mon,  3 Aug 2020 12:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WZ0mmjp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A992086A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ganapathi.bhat@nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9pdA9XI9ABgoYjpW9Amfosgi+d//PMy1oJeWoS2B9yb179roPoA7bpByYgzinTaog/fZkbMpVkxbql9PYzxrg0rHecEh6+acVOTAC1Fd94kWpaENlTkykpHqOBbmQex4ziACWGDQkTtptx/XAVWrlAdCC1UK8gZmzVwB3at0aP870zP9MCadYYKee+QThn2/qNta/uTm61NVAFfgk7tcjnBydvBZCjEaPT5+JgIN2qN9EqWJTe9VhEZquySgdbGvSdaTr0XBCDdUM38EbdZhbTdkgBODAIfATvLyrG5PhNN6lFzINnRVkQEkporjxdak+Ym29yFe+PivQ44MDTlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckAoY6iPPbKYyD2n6R1B0tqt7WHCqEaEDIrFekcVJ5g=;
 b=hNR+mYhRv0yyxsByw6IiqPrLXEcN1wY8OVaR6lqsM/a4cGNgZts7Jb4Fcc0sod05taQg8Q0i4HMqC0MAE8wnCPLjbaTvTk3JeE88U0Okv7Tv4QRNZjftw2G3ODpg/VzYJmpygkBkORbI3x2ZscoYLj3Sm+ze4vGtQmCUjcbsFfItK2QyJfj6hysWfpn+BJcPqbEtoHFIhhX+dMI8SfC0ofWbnwg2KfPvP3Ifbrkm/ti8QvIc0Ox3Ij3Wcd6efQQEpT/Dct2/6WtGAb1iLwrT2y7pToegzdy/mozXZzG6mMvY1JZAK/UYqxxIGIYt29PjG5hdMDly1rilUNPuezrgLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckAoY6iPPbKYyD2n6R1B0tqt7WHCqEaEDIrFekcVJ5g=;
 b=WZ0mmjp8ANPQ8+Gvn/HBEYdd5AdR6+ZgjmcMk5Q+qR6PgekrDhRL8aDnZ4ZBMOwXmWmoP8ojwFTwdglfm4pB+xoZjAR+QSVOpKcIVpwR6u8sQKucuOXWXiImZk2NdIKIQ86AIBCH8R4x6d4npmgl9WALK9CFmmJzdfJIgAHGCj8=
Received: from VI1PR04MB4366.eurprd04.prod.outlook.com (2603:10a6:803:3d::27)
 by VI1PR04MB3168.eurprd04.prod.outlook.com (2603:10a6:802:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Mon, 3 Aug
 2020 12:30:12 +0000
Received: from VI1PR04MB4366.eurprd04.prod.outlook.com
 ([fe80::8937:c469:3af3:9666]) by VI1PR04MB4366.eurprd04.prod.outlook.com
 ([fe80::8937:c469:3af3:9666%4]) with mapi id 15.20.3239.020; Mon, 3 Aug 2020
 12:30:12 +0000
From: Ganapathi Bhat <ganapathi.bhat@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>, Rakesh Parmar
	<rakesh.parmar@nxp.com>, James Cao <james.cao@nxp.com>, Cathy Luo
	<xiaohua.luo@nxp.com>, Zhiyuan Yang <yangzy@marvell.com>
Subject: pull-request mwifiex-firmware 2020-08-03
Thread-Topic: pull-request mwifiex-firmware 2020-08-03
Thread-Index: AdZpkdG26iiWcOD+SMmg73+dUAtH4A==
Date: Mon, 3 Aug 2020 12:30:12 +0000
Message-ID:
 <VI1PR04MB4366D4FA1242A8CAF7D2A34D8F4D0@VI1PR04MB4366.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [115.112.95.158]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 66677088-e8a7-4bbd-11f0-08d837a8f7cb
x-ms-traffictypediagnostic: VI1PR04MB3168:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <VI1PR04MB3168E1E86E76C4F1475912968F4D0@VI1PR04MB3168.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:330;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BchXlJ3IcmBadPHZXIw2RwHOJ/ZgOy/K/urVhyK20Zg7ldhGQ1VOtNN0DwOVnkQb8cUKoGwlSz6rECn6kEs1xp5kh6F7XHVWEVTF5Lzl/becRu3VvPkMgb7I6SEkBH5HfL2SOaQz8Y6Pxe7FdBLfyRRZLrpO42AAXivTpbwyLuxcz+6btl9XDNN3IKlhkwEhqHO12qJ8pWukou5ASU6Uq2+qPLORYJjRNF9E2BusiCR9fKF656P0RjD6osLHHGDiK2wKE2lvvcWVYHFo0LaZbOK5VGXPuyDXXu53DMmSI2ycl/SlBidTVWhNSJbgyN5DlH+DENsmTrEU+5rpaR4OeY9rzkwAwHYrOk7nlLUi/MOTie9LWGCEkMR6qk1wtW+thXWyX/XQEXnsoZcUEA1Qlw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(52536014)(55016002)(66446008)(9686003)(66946007)(4744005)(86362001)(66556008)(83380400001)(76116006)(66476007)(64756008)(44832011)(5660300002)(55236004)(54906003)(2906002)(316002)(6916009)(71200400001)(478600001)(966005)(26005)(7696005)(8936002)(8676002)(186003)(33656002)(4326008)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 1giprjr8onRJJe9GYwIWUlm2/egp1keTGZOttUil+Q5kEeNgXLmveTyFmlVq5/EtCAh/hSCSepPTnLCEHyMsP+KsZ33FM1iEqMCp1pEj9Jt5pvqm9thyw7Wu3d2/1IpmfCT/9HiXX76SQWol+6YyYuqJioMzfOTMjToTHMTwRWytD+XG/Vi4IJ9xvoegJIdYpIF7OENrYzR8BGh6iEkwf/UjUhTC2+Kthj6MChOthxFIp4LPujhzd98kW30jOo/E2uRm6HDEtMXCSdwRN483SNCE/jvagttrq2ocfX9HKgZD2+fMwPiOhHvpvk6LanA9EsveqWw1k2UblZSHXi8JtltIs+nUUlWfADXanSNebhawspDSMNNA9SyUiIoShg/H5Qv6hePpFmazpPKU2v6sGG95ZUU83iV9k4a2IstIacM4aaL9t+l2AxuZnOaH4N4RuH+IvAC44k/DkEawYCEMao9PuzumXPI7nsPJX1Va8SPROHs1lhQR9SUhcusAKoh/kjLBXBWFs2G8AeX840KSycceaq2cTTY1OuB9ku4mo1CDsUpiAZ9YP6+qclYgoX9xNjCxSj9FrzPPCsg1ilkR6mqy3X15x8Ctn8CFmOnztXD0lFZJT7hGCiJeAk13B5zhmlEhOYWUGjC/vsMjfI0+zQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66677088-e8a7-4bbd-11f0-08d837a8f7cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 12:30:12.3120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bePCbf4xoJx/TPh0FGkERL8pdUUPsxjc/zIZXo/vqdJZgbwPeTeDWz7UMXMxS8BACFrCmGt1MgGGU4HkwEuUXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3168

The following changes since commit c38b125a920a695d360b62e8b1f7fb1c4e1afd46=
:

  linux-firmware: update NXP SD-8801 firmware image (2020-02-06 09:19:04 +0=
530)

are available in the git repository at:

  https://github.com/NXP/mwifiex-firmware.git master

for you to fetch changes up to 2a0a062e79b5fe9007e57c0fcd285e683e22373e:

  linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 =
+0530)

----------------------------------------------------------------
Ganapathi Bhat (1):
      linux-firmware: update NXP SDSD-8997 firmware image

 mrvl/sdsd8997_combo_v4.bin | Bin 621896 -> 623240 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
