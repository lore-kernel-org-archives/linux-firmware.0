Return-Path: <SRS0=VFNp=R4=intel.com=kiran.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76397C433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Jan 2022 13:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AFC6C36AEC; Wed, 12 Jan 2022 13:16:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57F0BC36AEA;
	Wed, 12 Jan 2022 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57F0BC36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641993395; x=1673529395;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4hLudZUNMq0GV0dGB575uBbi/RmLkQYAEN2G0sf2C8M=;
  b=CsXwAM2dv0IOBff9Lcym4lOuWGlh+vxY4hyd5IdOPdeM+Lo3vxGg1tZE
   xk/AizvnfTumD0rNE1I5eK6znR3GMQ4s/JbjI5qiBKJ0PFF+6zlXcSGrg
   gV6QMI9Wa/cl5/hg0q4tp0H/edfpSjFYiNbtG3KVrgS6EJifshM9RaaSw
   wOOKdZsPuoSUxmIJJ62z3aQnnyEiNwYtdlK2j6CO8rZ/UEyaNLmCObmtE
   jQEIi+4DmPSg5orvBMIlMaiLuI4AZf22UU8epOjhHHKBdH/83zq4TTaR+
   VwFHV5N3l1bTIrA5XXy9ho7Vksr6+1HRELCGRTUdC5g4+GLz/bRBnzuqS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="224424555"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="224424555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 05:16:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="670142528"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2022 05:16:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 05:16:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 05:16:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 12 Jan 2022 05:16:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 12 Jan 2022 05:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuKCcxeXsfHVi/tX9nASX5spb0XqUArU+tRPxncIBZTR/oJtlhZ+EO+azOq8ePnR4+2EBZIx/Dnd935/8qd3W1fQmdoJtSHRvnYlMlOjuylHDNB0zRYcy/Ds908RajzG1H5aPRKYX/98Gz9swMA/VlSgQLuKsAljpRUGk2ciNNYF4IMWKvqVcIM5QpIFo1O3Gdbtd53JHL0uX6FyYyFZ2ShBL8kh4MaO4djIO27L4XpKPgIwlcrehgQPBbbZnTVuYFqQaC+h2LvCnsNFgXx8r9W0VXoehKBjM9dlTUG2m1+R8/H2mFggmv+2quDdscsYBDXcY5sqrrCmW6+jZEjEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAwwhlVwIBnUbEvw2qw0H7eMY0ox7fG9oN3fUlZO+JQ=;
 b=VquEUWJO3k51EZixcghVhCOk7Gnu/tJ+Z38HCNUx2YEK5tj6Ka63/zp20x6SSHv55aodVlj/QSG55SKca/K7F9traq1/TWA4Sh68OQH5oBK9SRpSFBfAZKE5+KjjQwP0L8HtVqlVgCgpiMnm2UBUSiLO8L9084BY5JvDlL1/XCtzjHCcQaz6h+NZCLmAhHPsu+QPYzQPf/hfaRx3taYRYe5DzU3ZL380ykq2YRM/5vAjarzqFJ6+myNOlX7LBJF5HnE9PK8W5rQ06KgqqF8dPcKfD+KyWehlDxJCqvbK7pMKgC8WLNkroLAG7n1Rlpr8rqk6/etMncxx3a1ifDTsjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BN7PR11MB2739.namprd11.prod.outlook.com (2603:10b6:406:a9::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Wed, 12 Jan 2022 13:16:32 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::843c:97bf:61fd:5151]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::843c:97bf:61fd:5151%4]) with mapi id 15.20.4888.010; Wed, 12 Jan 2022
 13:16:32 +0000
From: "K, Kiran" <kiran.k@intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>, "Srivatsa, Ravishankar"
	<ravishankar.srivatsa@intel.com>
Subject: Re: [PATCH v1 01/13] linux-firmware: Update firmware file for Intel
 Bluetooth AX201
Thread-Topic: Re: [PATCH v1 01/13] linux-firmware: Update firmware file for
 Intel Bluetooth AX201
Thread-Index: AdgHtPOQrBioFHHmThyb2wcbRV3d3g==
Date: Wed, 12 Jan 2022 13:16:32 +0000
Message-ID: <DM8PR11MB5573AB432AA710C55E99BA49F5529@DM8PR11MB5573.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6965439-3770-4b73-7459-08d9d5cdc0b7
x-ms-traffictypediagnostic: BN7PR11MB2739:EE_
x-microsoft-antispam-prvs: <BN7PR11MB273904300CA4DE05F012537BF5529@BN7PR11MB2739.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RUycgrrHk2wk8poSHMj0y3JhLWaRuSssNUgIgRgZI5pwMReLou/V2FSdbGmsDi5OJyBItE8ieKFAegc55T+nkY4+cROK2lRIxY8ThORCGtWLfagUX0bzY+cAitFkSDHhFul75nddCdFMwFcQnh13gYyJWTh/vjXujtMXTHNQW8Ic14d/SiFTchqJgy5MCLOC6WzD3XzJbwgGMlU0sorpN7YlGWRyp6RxAxBc1lzqpB4yRa7MJqKXBjcfEDNq/AzD6NbpAcSVy7iQus63a/P02/Gcpf10gta3ko2FhdUAP0INnIsVPRJWiAKJlEDclFbBgxlYFAdr8+02g2+n7ppk/U6NhcrkjYRhHWbqb8AiDfC0tl/8MBQcjrqosiRaj46IOiQqY7j9pO9yzoejko2lWLvV7D7zpyuiUlK38w4hNBcwn59/AZuOQ3WBaiZXh1Qh9kuUlIVgetO/Bn4Y5iTxxbNFQNtoPBW+F8iXm8cmwX1chM0QNttyKDXIiyEbah0AnbL5jA5A3yWEqArNDnbmKr7puOo5R4rf3rjcKsm3U6THiHbBiN+CSaB1t//bX24BAx2GKfpXOMO23saFgu9LBCPTlNs8IKQ+A/PlnVZbBEMuasJ0RegEBjgnPOflx2d5PBwaLddE7o/ORRiHQ6con+2ntSS1IUTPKeFnu/1taJwu0RBQxf05pu5xqAjmj7GWJClS5YMaoS5FydGCtLvRSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(122000001)(4326008)(7696005)(8676002)(55016003)(52536014)(15650500001)(186003)(83380400001)(107886003)(66446008)(64756008)(66946007)(8936002)(76116006)(66556008)(66476007)(54906003)(33656002)(9686003)(82960400001)(6916009)(71200400001)(38070700005)(26005)(4744005)(86362001)(2906002)(450100002)(508600001)(38100700002)(5660300002)(6506007)(19627235002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B/Tj7hXjoect7nzZSiopQvzInD2FS4h6klW2ISOCviDSUG0AtUmbKwZFKpvb?=
 =?us-ascii?Q?kSiBLZ2JGL4LOCP88aUodPeqRk57PYwhlc7RAe6oSPFv6L9IO9qGvnFVHO6H?=
 =?us-ascii?Q?WOrp7gDKG7IUmPc6dXJDuVnSAzFYijrg2MuzdYAMVD7YI6VkYk8VyBi2PGBX?=
 =?us-ascii?Q?ttjLwstnIQfXNXaij1JDmNEFm056qHvmcDZJSf/4OKx2cGxxjVuWCuDoNz5S?=
 =?us-ascii?Q?jnN2mSpBw//JK0Az34AyTULTaq9JeMdaNwZToKIIn3vrF54fBYfo6Nz2b+Hj?=
 =?us-ascii?Q?pPqiIa1fpxKrKHbt2GoPwX4vugWgpQiu24mj8f+ELB56XnV3jJbLnD21K0Ef?=
 =?us-ascii?Q?XDc9OUxPr0qYa/FznoZkzEOP4OVdFeJmCz/ap5V7OfbP0Ow3TWdRCZQcxkBJ?=
 =?us-ascii?Q?4YsLhPbTk2TzLw7yYRXkJEgXXyFTZQsvo5r29mQlOb8Xx0jkuBiaXNvctzbh?=
 =?us-ascii?Q?hK5SO1DBqg6yIPub/tbTbQeizOSrCEcOk8f4QGwr9UcRNgsaQ2KA9ciPv2B0?=
 =?us-ascii?Q?7/ZOVx6oXV63DwvsqXdSE0aS0gogvnibk+5CZOnIreKrhQPsh0g2o0PeUwEJ?=
 =?us-ascii?Q?TnYk8hKzdth6fghCO3rcblg8EQT1+yaJtu1EaMmheccsIheu1e1E8/p/dx+w?=
 =?us-ascii?Q?quVt90johGmTV/4hHjn1u9CBhhmXf1r8oKy81M922GdTT1cgVE17qjAz8xL7?=
 =?us-ascii?Q?LPo6GAEZurfaaBAicpQL/PG80RFH4YLxd8kbAiLyptCpezE4Ut8QTZlvNeCi?=
 =?us-ascii?Q?ypBthjNy8yb7583XaS3dTZifZ88l61sY24wvJ4GIjRi5yOmv/gvoRWgqlDOr?=
 =?us-ascii?Q?XS/pgP1PkUUItT9mTANO3GX/J3vdDqQRNu+o8P6wnzgdf37XJ3+Xg/HyHHdm?=
 =?us-ascii?Q?Zii11C+L6GKXYWw/aN4m9d0078MIUAvpXLGxFYAtwQh5pU/tAPUW9cKhBePR?=
 =?us-ascii?Q?63XXtX6HKYFXTlsdCEBwKUSdO8RqR7GrGLKY5fyoTqiSKtBuiRs5yreOvkph?=
 =?us-ascii?Q?vZVaGM0PS630UGK5gMyNPkoCfr0duBLCs9Q58GkNAL1gzGSoCYSKutbw9N2X?=
 =?us-ascii?Q?6vsHP+5gmN/RXhT4fPvzlQnGLPzz3wxhdOWG54mL/48MEIvI762MN+sLr8gN?=
 =?us-ascii?Q?PC5J2iW19JSABMY24eKpuy9VJG0RpaGqQ+ItNphO6sQqx6M1Dj2z5NXSTv9a?=
 =?us-ascii?Q?wUbr1UCCGknIs+9LS40nFmlFJ8X6TRarQl1pPseq4s5v38Wk2p/HavrjkOtp?=
 =?us-ascii?Q?Py3XFMfzCCihYRAFB5JruUr1I2yBEl1iALt4U35ESS/2KtpVYGR2sAabjPD6?=
 =?us-ascii?Q?mdIwVrdMuQzltxfg0YVJWsHIzXASjkSgazxjVC6J5YZ8Kt7u7KgBe2W1julB?=
 =?us-ascii?Q?1zOP8PjAtS0LoUJEJfKYsKBKGEX4UQ/OauywW+w43VqAhQN3zy5VxZR/yktj?=
 =?us-ascii?Q?eg5oOtU3rTKuF8wkNqefVvUk8l5jt/R9uSSFOG+4F/rud7gzEt7s1HWNPDQ6?=
 =?us-ascii?Q?pCqQajtOmD2hBQJCOAX9/jfjT1bCUCnhQeDmHSeftNNbleR8hr6utJQa0HY5?=
 =?us-ascii?Q?QVFTG617KAQ6++a+YTt6pHobGThyGZ5KSdd6BoXqFPdKHCxFHSbbbFoF2W1v?=
 =?us-ascii?Q?Tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6965439-3770-4b73-7459-08d9d5cdc0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 13:16:32.7115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8hl/aVKVFzdZOk5XU+rMi6db3XORAEz1mLngrOCfCMjM7UmdXdFa0XxTgvTXfAKU0pMj57u+D6198ayGSGczfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2739
X-OriginatorOrg: intel.com

Hi Josh,

It was my bad.  I pushed new set of patches based out of master when one of=
 set of patches was already pending for review.  I will combine both the pa=
tch sets in to v2 version and resend it.=20

> This doesn't apply because of a conflict in WHENCE.  It looks like you
> didn't include the bump for TyphoonPeak from last week?
>
> commit f4dfaa47bd6ef26c7abea0f5446b7aab8ebc2ab3
> Author: Kiran K <kiran.k@intel.com>
> Date:   Mon Jan 3 12:49:02 2022 +0530
>
>     linux-firmware: Update firmware file for Intel Bluetooth AX210
>
>     This patch adds new firmware file for Intel Bluetooth AX210
>     Also it is known as Intel TyphoonPeak (TyP)
>
>     FW Build: REL35927
>
>     Release Version: 22.100.1.1
>
>     Signed-off-by: Kiran K <kiran.k@intel.com>
>     Signed-off-by: Josh Boyer <jwboyer@kernel.org>
>
> Bumps all the WHENCE entries to Version: BT_TyphoonPeak_REL35927, but
> your latest series expects Version: BT_TyphoonPeak_REL34345.
>
> Can you rebase your series on the latest tree and resend?
>
> josh
>

Thanks,
Kiran

