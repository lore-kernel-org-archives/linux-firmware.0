Return-Path: <SRS0=rpuY=B6=moxa.com=CrescentCY.Hsieh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBAAFF494B
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 07:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 145CEC19423; Mon, 30 Mar 2026 07:21:01 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA51BC4CEF7
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 07:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA51BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUseW6s2gvbvPXWs0hkrISy+66NDu18qZubbhbayULlTNI5mruMS5CdExfqG1iP+GOZfdCpVukTtxQrDKA59pjgQcUno/7NV4+aY8EPzuDiSSgvwal0ug0w7bdiK/Rx8MteHgymOoJNM0triF2uQj6g1lPASPed7fkEghsfZGSfdbZ9h6EvjYX7oId0mT9ZTqqiLTFRuvlj7WDeB2aiyisS5c1eqXipR80BORP+CCTuN/lu/qOOThtvg+Dnt3Y1xKtKjpzPWguKm8Zg0cHc5zM+9jpKsDwbIX34DOsl4YnB8mN5VEqZ/+QTtI8F1KPNnjbM6xBbTUYG3dXSGLQbISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f55RgxbhH6/LqjZ55eR+93VFGmrdLTxw/Z4OsfPfE/s=;
 b=YqZAM3yAVH87jhLoAIJbzUa5cG75EjlGX3SwtXjznPZ7f3sTvhLVd0Acsu1dwEzJyPTuArhZ0TmMOJeoapGz92woB3wHAyyWFRPVJyPsajwqnCClgWTSZHmjjTeH+HpLYkZsbDV1uoAqueb3imyiYlmSWjohbmbaUt5UnbMuEWrJB6oBS9F4f3UuVlvTOvFT7cAnqCS84bi1KKD+n43qA4uOjtE8OtW5qbieNJK8b02y5qiA7SjXa4/ar2UN6x9WQdD+1iMW9ekdDtAlVMdZzX3ZsAcTADNN8DLrJVOe5O87V+MC/auqbuFWTjpBBBtxHEEkw98vKapN4INbl/Du/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f55RgxbhH6/LqjZ55eR+93VFGmrdLTxw/Z4OsfPfE/s=;
 b=SChXXM5D/40H/Y3KYWyPyMjlUoDWsHdRK9FwKugNY1C/xuL2DQ1XVJn8xGZ64yN/ddKp+btIrB/1LZh7DnxsEvlzJs1wdF2yQsfIzGQspGGjmowYextfdN3ecyxi3Zg9xdLBqTe4LBfpSD4p+kAec/aV/9oOqhRUiPhFSjlwx54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY0PR0101MB4820.apcprd01.prod.exchangelabs.com
 (2603:1096:400:278::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 07:20:56 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 07:20:56 +0000
Date: Mon, 30 Mar 2026 15:20:53 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: add firmware for Moxa mux50u devices
Message-ID: <acokVReiF51Bmqug@moxa-ThinkCentre-M90t>
References: <20260324024635.349522-1-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324024635.349522-1-crescentcy.hsieh@moxa.com>
X-ClientProxiedBy: TP0P295CA0018.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::16) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY0PR0101MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: 314b03bc-e5d2-4b78-9c72-08de8e2ce240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gypQnR+BldCeEuDX0NeM6ajYkvDOmMWyO2iUOvoNJFbVYipnTX4XqSyhv2KNe13ndMckrFBXJ2sewKyWT4qwDrU+uEVjXQOcSb9EASzTmj44HwxjzWV3aUvRAbEouR9O4xTNrLiPoGsJmsZn7yOiwYxHHYrrW0VE0/hfUgIlSS/5CAp7HsCEoSmvBo+jRnFdjdHE0Jdfx6b133L+p4EcjCVBazi6EUmKt4hus7B+P8F8dHWERepbHzj8Q8HvVKwYM3YSvS1WTBP/SCmBnO5/cWsJA6nSPCJfEblJ0FZsXs7jeOcLhxxVoW7t1vx4RL01qfDs1kD8rW7H0cAYz/xFh9NqGU+VugO15WmbEgiTVswBI3h5fTyufJJ3sJeLaHdQA/YBiiNJuO57cJcp7BYR6zpWtselixRZRej5II4udnQaRv5QouBQKC52WM2WuunaUdBk/M1srRKu5clxkipvt4v2viogUmF2oHoBe3hVwxl7cUixoC3zR18lHTH/v+99kSag+SkPyt6rAKmhZoWWR0OIWDDPbYPRMCcdscYC7FJNaxSDup/Fnh8vQRU+6YJsodeNb8BINUGJWj4/7y70oVvWrLqtKQkLiMPQb5NE9W/cFTlT4SbJHwApEvpSnS75Yz7CLF1OgD0z4Gcg0afvQmsdmUj7J2PVIefMQD0Vq45JKOGUpTkUhSLgH0HawkKGGN/VewtaxJN3g4wFSh8MrNPe/YJEmCX1mz0QN8SMOuy+7ePAofu4+TB7yr267NF6e2BaDhGup0gHkuxLphuemcLECIQEmbwWTS/3OU7wNYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RLgE603o0XDpQybhOinlbeMn0MVIF8LKnm1mzYzW+mq5Sik8XjZEP4E2qqFi?=
 =?us-ascii?Q?7chtYMbGR49l1X0n+MfUnoVjvhoH+B/ksz/M9wcwyjBSOk+FzAiWpkN2rQzE?=
 =?us-ascii?Q?983oCF2WYeC5sRF54hkkkegptLVkrHASEJAk1vAIJY+LMbMzjZyTVI1G9U+p?=
 =?us-ascii?Q?M0izYEiSniRgyOHbhc0satJTriun5vi1cWfbNrNLE/rC0Epj/D3r2AZhCIuo?=
 =?us-ascii?Q?lhd7S6TReehHupE/UbNvKhh5I+gSIzV0ish42sxXnG2c2FNfjHiBZll9JkLt?=
 =?us-ascii?Q?KYVCVhEtSSwXE5PPex5HpwLYkSC+rPejfpI22oUFI/YCTpecmFAlcquyMcDT?=
 =?us-ascii?Q?9iLxAfE/BsBGdO9XdBOikr/jZU0e9DZqMPkkWjSwukewjS9MbXkdr9tOZM3M?=
 =?us-ascii?Q?za7CqtRrqvEGnLuUPaBdS9zrhn/j6tvpibQBZanv4XhuRyEXrh3uAjicCSZk?=
 =?us-ascii?Q?SIzcfzFnbXbRR3p14XL1MDbWcl3Q9sEiqwYcFDhVZX0hAF/b+4CgPiWv08EE?=
 =?us-ascii?Q?/jzu4rU8yntJlZZpuCax/0ZvKB/cJY57DYMoEbSEmMJlb1q5lxINTq30mvog?=
 =?us-ascii?Q?aQmET/3ZAViXzeVZyR+GjTrtLZPWLzBLY50ZmPHbgO+bJqrr+99rwSQct9Up?=
 =?us-ascii?Q?6YgFfUpsbjtFMsRc/mCHFhoaSoe4gHtpL4jBT5Li4Xg84twsV9UM06EJWgok?=
 =?us-ascii?Q?MMuMclBf8KCF0Golj/aZt1sBLfWg96HKS66fK3jJPmjHPdzBdwVFwjf47dMu?=
 =?us-ascii?Q?D6Geq6P+wzLynwnjUhybeMADt9i0J30KH9AQtYuHHGFrN5pDMU9Qjnc4Sw9U?=
 =?us-ascii?Q?qPTx4rd3EQwhNkJLQis9jMpx2xx6t2TjrxZXe5iwv/3c9tyDyUVOJ+SDcRCU?=
 =?us-ascii?Q?Y6XyArJvq1e5XbrkURE1AVHJnHajeU8GdBoNmij9WZZkRB/cKsfzjka8W66/?=
 =?us-ascii?Q?bneIpASi+0zUtHepNXKTNw7igFoQG+nze/SUQCM0yXkhKoHKZJKbkoU5SNmT?=
 =?us-ascii?Q?bcimEMDKPQSXLr4bclLP27+8MUHQ03ca4WmcT4+YdiZq2JTQYPsjzH9FKTh2?=
 =?us-ascii?Q?YyP+Be4mwdv0wY9+g59Dmjb5esAq7g2hUxgA7mRRnY99UzP/I0UibHOAx906?=
 =?us-ascii?Q?cF0BQl27V4oLYRUCro86nj7yfxbU35O2YSEAIIDTpj+ByXVC20JmuB1xzUSB?=
 =?us-ascii?Q?8djaJK3MF3NBynovQ/eXTrIz/3ZOu93st9gmxGVnYRJv0Mno6Qmystz7i7Wo?=
 =?us-ascii?Q?1wttJGhKBNnmB2mk1UkLXVnbRTNdadEf05bJncW9hMl7TsWLwZxksIk8bgeI?=
 =?us-ascii?Q?8//2Pk/+eWKkVNumHli0GHUe+Hqxnqt7u6fGJkNSUiTWb16OEkBNtGbUTrDh?=
 =?us-ascii?Q?fGWuMBwhgzHAQGcmfsrMa9+yQPr+2JPYHEKxINkriDVVUu3zdl7ZczT3EV6W?=
 =?us-ascii?Q?LWZrxUanb0xobKFqV+Naxym3xdZavH2RTV69uW8rTGNZAZX94LDl7jSb7ClD?=
 =?us-ascii?Q?+3i5DFbXZ/oKRhrSjo7ieJvg/+RqnSvSkhm8949KZDlgh+vlf/awuxzEVa6T?=
 =?us-ascii?Q?cvLK18I6OlFj6UAX03TVpfA8890M4rn60whs5DRX25EeuBL4WjNpEr0yxOBa?=
 =?us-ascii?Q?p9Q2WlAtVtqT5brMCkCZBkctpEmVd4GtVjQhGIg6vlrczKi9/Fk24uKqct9h?=
 =?us-ascii?Q?HpdbroRaxgMYecEcZKMxkGG4aPNDDUJ7xX1k1V5nE5Hcpbtkq0q4FfEYViJi?=
 =?us-ascii?Q?e0SN2O7r0D8sxExMpy38Ud+q/heHu4U=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314b03bc-e5d2-4b78-9c72-08de8e2ce240
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 07:20:56.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W74UhKuFxsRRa82o8sGo6GbLWno+FMQDOe6TcSvKrPJ8LlX3hMsr0BqXy1hmZ+4Ip+Z6+jQwxYZCDv1RLUfsgzZIz+5m4VwHijdVnTS6lOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4820

Hi,

Gentle ping on this patch.
Please let me know if I should revise anything.

Related mxuport driver series:
https://lore.kernel.org/all/20260324035041.352190-1-crescentcy.hsieh@moxa.com/

Thanks,
Crescent Hsieh
