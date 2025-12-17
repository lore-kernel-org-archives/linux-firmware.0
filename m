Return-Path: <SRS0=Qz6m=6X=renesas.com=kuninori.morimoto.gx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C8D66BBB
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Dec 2025 23:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 639FFC116D0; Wed, 17 Dec 2025 23:34:00 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4B3FC4CEF5;
	Wed, 17 Dec 2025 23:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4B3FC4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kpxar7Ai7rxX3uXFLdqscaXqeAsNO6hFN/Af2W05rRudv0coEQLtLmlLuGC/6YwxT3VnynCo4gFBeMnWlne03UA3r1tGTNp0sgJUi9kYL0RdsomiJCA/c7OrxLoSstyUlbbfgpF0ZMOJ1OOJP2MvtE1q78HDOF0NnGPpxnoOug6DifIj8DRl5U7+5E0QLSzcsFdQI2n5LSOHiRWWCvvxnHn3RDMVc32qdohXf/IGUwk+FeG5yBjq/rwF/J+uFuwbPrTRenjt/gt1hUt8CTd5PH/hWcANBvkaeoGllXVApnGCCg7TflH96vtobmcjnmuRMbmcqa/WtX7uv3XWL9n5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7JjWma/s+KA3DXIqnWNT4x5ZIAfnEhbkuR0QloJ0HU=;
 b=QzwLe9FK0ifBvvj+JRyK2qfz4tiAsUwRSsvzifb6Kxd6mQ16AoH8oOivHf7+woa7RIZX/QhkUNMXEJozZ6dV4YHRtwrcagDOsYphLvQ0wiJ7fhUpqrAnX7s/qgGcSH6S2By6/NUbH6qcxJeAIiKgd4NNFGtEpL5Ene6/dCAldnprUvGzejfFfjY/qgaMFkVBtrHK1vop2cfCwtFS7bVLtLMTctQPeVOLD1oIdZbeoIwROakHNcRDlJ+Ga94R8Vsw2XW3Od5B8rY1IrxqcIGyM5PBjBN1x47kz8ETKheY4lamrBf2AJD4oPobTu8r/WRHKI4PPuaMOAAgdlY7LkGzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7JjWma/s+KA3DXIqnWNT4x5ZIAfnEhbkuR0QloJ0HU=;
 b=G1EplCpJ4jmCmyYSiOXeLvH/+Xy/q72G+OhjmI4xlNBhrwLOmKpA+kiQSME55REVHPRZGC/hnMV8IDcXRPeCqfNfOyvbrCt3Utxnn7FWRlAApGE6/502yMRSwdcOAD54K6/drFSLb99bA1bT8wl8l5g2UACHPxaaDnZQHn2WOcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11281.jpnprd01.prod.outlook.com
 (2603:1096:400:3d6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 23:33:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 23:33:53 +0000
Message-ID: <87zf7gptsu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: goda <yusuke.goda.sx@renesas.com>,
	Antonio Costa <ancosta@synopsys.com>,
	linux-firmware@kernel.org,
	shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] rcar_gen4_pcie: add firmware for Renesas R-Car Gen4 PCIe controller
In-Reply-To: <CA+5PVA5r6A2h5ffYNnojEfarOC9i4ghWW8-FC7GTBi6XZfPk0g@mail.gmail.com>
References: <87wm2leuhd.wl-kuninori.morimoto.gx@renesas.com>
	<CA+5PVA5r6A2h5ffYNnojEfarOC9i4ghWW8-FC7GTBi6XZfPk0g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Dec 2025 23:33:53 +0000
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a125fc-284d-4227-3bba-08de3dc4bda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+BBY0XKPRwTh86WaHXtA8fHj1pW/00OdqNVrBCXJYDb7ObrRIghTeEdz4ew1?=
 =?us-ascii?Q?ANXjcDH7EmSzoCzFxDhzb7p1K7aBfKbYOfP/jgEHKBLTFEosZl7nV0HqdxW5?=
 =?us-ascii?Q?QvOxL1SXEB6mbMqNUlspFslsJmL4VeVRy+Sjn1QMEQ7djwAaqic+LhnvbRWu?=
 =?us-ascii?Q?BiVQ7727iIeVzG8+ayZV5+k+zIw4mTQDv5qqIXCOwXiCIusyY6NKPuFBQngF?=
 =?us-ascii?Q?fN6WrzWxjRAR3I+NZX4zZjZ7qSXCxh5c+PnLMM7bmJMlA2HLBYjIlshQmBpf?=
 =?us-ascii?Q?ZexjqvrBSlnoqLRFJHy6jHIpIEAB5/7pIfj+HvFi1D+hHQTqjxW1Achk/OPI?=
 =?us-ascii?Q?ZYsasF054yHCDkzJ/6IxNMck7ETwj8M/CkrjuTS+85pz0RzGqTCigUvshAEB?=
 =?us-ascii?Q?yokMfxQyesfMqe4x0A3CPYDunBjBQEdl2bL8q0dsWmoIgKmUaDjH2uhwQtt4?=
 =?us-ascii?Q?WBcrBqtJAcaEfwJA3mIofj4tJoRkCObZbJjZgNf+CLPHrzAnNaWtXCppYK+K?=
 =?us-ascii?Q?lkjfXdi8cpq/5OTCyZ3IGj00IgJNwPQJGrtYQMnnSBw1gsGUU14UYoOVdyNZ?=
 =?us-ascii?Q?UrHPrLMCgVcRpuAmf456Xu+WCGo+Ur/sVp/LV0flc2xqIOz5PTBNQrr6lbhq?=
 =?us-ascii?Q?INz6rKlZyB7cHKT8sKfjUxMJ8eyMieRMenFOJ8xYGCOKBxi/NIJ+jL+McHZ2?=
 =?us-ascii?Q?rmOEb+e9J+3s9OiRgRIttW45OHlRlEkjbgq/BW0sa85lLaUg/vAVg3EABcvZ?=
 =?us-ascii?Q?n96M8GIynafx54tuUU2xrxUNcPLqaDhnJm2Y+nKXrlbWW+ZCIlG8It6/u4RB?=
 =?us-ascii?Q?+35CAPum5kw1/iqHUzAIX8yRRei9Xx8MOfaiBGqtTk6sHDoZBM+rwHax93+v?=
 =?us-ascii?Q?3zNYF7DNNiD83+W752WovurZnpGIPfAXAJt5xvANBLJUqcAcZAQFSJAvND8T?=
 =?us-ascii?Q?1JBnsmrZP2iX6Ni2cSFf0/MbXwMqt9phEtUdZJNh9bGXlF5MO4SyfCaBsMFM?=
 =?us-ascii?Q?iYoc1QmnG4HouOD6B2WMzxQY61gxfjV4dwZOao5QsNUqXT+gWL0dc0KwLwhP?=
 =?us-ascii?Q?cyG/Y9zB1+FkpzGZ2aUl+O2Ku86vCwX/3Dqij9IKOBXOVzHEhZ/UCH6/y73b?=
 =?us-ascii?Q?lvYuVxTFNLwydA4zDY/Om2i1IcPaGsO6/3pmRrv38YODGUmpgsKdJFBUTVmt?=
 =?us-ascii?Q?6VJg/4TUJumu1+bGhOw4Kpe0Cz/4JRDzLCIG02IwO8ZsGTn30fGA1+w6rgbS?=
 =?us-ascii?Q?wBvebrfrbw70MxthyXFdC6+6SIsCAyG6zqaA8NtU7WaUUbA9FXHSdCQqdoMI?=
 =?us-ascii?Q?lhYHXQ6Qtn/r5hNj03b96xTNHU4jWvd0p9EeAxVOv1LUTMMi53/flbNEv5Mo?=
 =?us-ascii?Q?M7N08/KmfXH6n6//S7AKuszPsJzEsJFzaCpG6hHum22QBn2RET5lPBz7YLPF?=
 =?us-ascii?Q?EK/2jUs3tsCixbBqXselYfzAwmWEDqRn2oU7IlSvuz7XyfpZCqYxAaRLYFV4?=
 =?us-ascii?Q?1c9T1q0enx2ECygO9rGfRfX8u6kFwDLZb9xC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVqp+YqOIonE9NT13iD+M/ufP44zEF+2LoxXNGKk9BWcDPYJRugbYx56D6Bj?=
 =?us-ascii?Q?VYKxEeOGQ0XLk1nycNxrlFSoxxONr/FHLsZjvvEaNhJgJjdPPXys18pKw9Ms?=
 =?us-ascii?Q?QU3rKRPm6AWtNWUUyD5QQ9ooRfWm+PnGd0A5GZIf/YAl+kNWF6z+fK++Lboc?=
 =?us-ascii?Q?pI/GlbLncmMRYM87kVciB2DQDuW+HOBcRVsNdzM9NySltig6dBQdiUnFAOld?=
 =?us-ascii?Q?DBIk+wsDF5SEcdA1uO5JlIXIHQYv1UHwY4JHtyCyeWvKMnD6JNis+87hGayp?=
 =?us-ascii?Q?wdh9zr0Z3z50UcUX21z2uwDS+2rBViqE55StVy+9Bu/SWA0WgKvqmiPdmDKy?=
 =?us-ascii?Q?GdKg1JUMGGK2bU+vqKxih1ld7vnLYYnlZB6WZ1M6ajrzNxN5aP+peY97JJvc?=
 =?us-ascii?Q?NZPdNknOAU3CVuSXzzufvjgHbWat7FKFY2wyfWItVG4NB6xl5RjI0IhFLqe3?=
 =?us-ascii?Q?Y2yUCF2EWevGlSVEdSM/PEzDzXc7RqhjMOzP/XI89+0sOzepGqJQ3tyEgme3?=
 =?us-ascii?Q?RlGlOoyBS5dQ91nHJzGZftJAlnRNCI+I/95WyO1vnNwjE32IfqzTJWb3eJkw?=
 =?us-ascii?Q?qBWqXSINlYdcnLgXpob7kWP+4kAWta7x4lRvSTSnZq2ZVhtvZgXW4xjBygck?=
 =?us-ascii?Q?ojMC0Q+olF80QrKXKLOTAyZ991t2YkrbbKq3D+/FL/i1D1x4Lo8TujibvZSp?=
 =?us-ascii?Q?nz8T9wL6XXhb9Bep47N4OWmlRB3hKzhoxB3Z1AgJEbiN7cmzFlpkNzfQgTv/?=
 =?us-ascii?Q?lFBTWqULro2Q2Hu3ETsRXKKJkoYw+1bFfVZuPg/y4lBI18G7ugTOOiBZ0ngd?=
 =?us-ascii?Q?pfpbkwLF1AJLDfVGiEpzmnfnd8/100E2U1lMam5yJ2K8yZaIFttk0HQhy9Z3?=
 =?us-ascii?Q?4E/9bsrxxkoUturRZN/Uh8ocaUI31VzsnKMrECdNjPBju4P2V3LzBHoAy15w?=
 =?us-ascii?Q?1moW4dXsm4TWPulwsCeqY2hYz/cWK7AyzP5nojsA5cGT4D6efZ21D5IBKO00?=
 =?us-ascii?Q?Mb+b3f/xR9viy/OVawO6ifaEomEoxOtNUr4vFXTHkKvsUYwpBHSWvf/IrtlZ?=
 =?us-ascii?Q?A9BcsDWAUSG7RE/0aMS4alv8MQJBQKsoxRfdo4s2lBEg+2gN9NTm1fgkkGHW?=
 =?us-ascii?Q?HyI0oXrPRli1xfRTRizmPm2XRAQcWt0RQGoMZkD2oFGg3k+g665TOwzpGi6s?=
 =?us-ascii?Q?Lv6RVSP7JQ4ZYUYSws8jPnA4RbMA9uM4pQ4Od9cLTiIaU6JlqkHNvylhF1zU?=
 =?us-ascii?Q?ZwPFv306Yj7Sucklu1nZ8UQlBnngC+oVKtUaXQBz6gS7XHxRw72llH/jXmYL?=
 =?us-ascii?Q?LvkSy/hYZLT9eSbmPwUIAQxWNoPNYzNuCK0Lp/UY+uCOOTKzqhk/hAAhpOI1?=
 =?us-ascii?Q?aByZSUaTfZRUuD1iKmBT35VdztF3IuKPeH6QK2LNfL3bH9vfSS8KZwh4saSj?=
 =?us-ascii?Q?4S7ZVrrZ9DfTguRnq6GgIxvlw92V2bZr7HlFvFwlmt0BTJoeIIy9POhegQUF?=
 =?us-ascii?Q?99H1DBjH5DG7/dTUSkf7VC5cEw18apBiIT2eYXkCnX8d1WGnGPm2f1t3gsED?=
 =?us-ascii?Q?Y3GDQX0RWdzyZgSxNqG7pLWpzSoXcpc5yOCjJH5cdm40GrXUMIVRh+la2TbF?=
 =?us-ascii?Q?05B11Z6haO7o6fw3visgVYw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a125fc-284d-4227-3bba-08de3dc4bda1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:33:53.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/QmKkhdLkH848NK0NNfyzwN0rgTfg1tg/kr61/sJnQBvGtrImbVsbQNzH0UcoUfBJga1iDBMVZl7oiXFfl+kzd4UmOsO+6rCQGK7FMx6bUYMdbBqrSIbb9+Oghp1xLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11281


Hi Josh

> Please remove the executable bit from the files and resubmit.

Oh, yes indeed.
Thank you for pointing it. Will post v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
