Return-Path: <SRS0=2U7m=H7=outlook.it=marco_giunta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ED5CA601D
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 16:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC9F31F00893; Fri,  9 Oct 2026 16:28:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.85
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791563324;
	b=jJZocZbDIgTw3siQk+USZg9NaXd4xLyPgfSHe8vDdIYXw240VunRw4RfIK7k86Vr7uDJ
	 XjlMu/EliQ2wr7fcAwT2VGl7BYH+VsF+zNtgKBN+hZlB11fsYylFdgoLf/31So0epgmbJ
	 80qXyYsHtsndK3NRCI4/SkM7YX0+ub8EMHrSo5ag5lrq2+KSYue2APi4cmd0RyDg4PsVm
	 8ZXVVqNEyzXTFcFHq+oEMMI83rYubTFE/hCT+t9davfjyIhR64iGpABrss7VH6fpzgAHi
	 Ybvx/kDuKKSBS2FHJe7N73iSEo/U46xB/mSIYbDGVy+r9paWe53FSthYLwV1x29P3ag==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791563324;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:List-Id:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=X88HHDrIrDXRi/DjPOIADPxXH4Ksd75DPA6M95RjgfI=;
	b=Fp/t/hPr/EsoXkbLENrCv2g+v7YbC+lzYkVBH7xpduRljOYtcK3gLvoefdtUa5FOpxzu
	 5claP0uLyWlPr7t38TvPfUsQ+k5jbiRGFIs5A/43Ne9/1YmCwiNnzB6nCGUUMvG/QQj9R
	 0CMOdhuJS6+jshmIxhpcE5mjwR1ag911gC6ks6NyOWqLWcxOaSTIeqKEUluLMgrdLB+5i
	 Xe3SEPsrqSbEcy/nMkyZvVBTxT0a7ZVKUFD8iQmhw19x6kO9X160btAeDiWkHXQEXoZQy
	 LTzI5093q2uRGis1Zw263NFMKTNv8YD4ZF85DH9PSP0lNMIfhqop1u9PMx6VeU2dNXA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=nNCGTHR9;
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.85
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19013085.outbound.protection.outlook.com [52.103.14.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 441BB1F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 16:28:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=nNCGTHR9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 441BB1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.it
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCFm6KpyjMfKtE9+oWgV1LYR+5RO5SPRTPoMUYy0bi8TAwY+U/rNY+Zdn+UkdM5VNqr/dE49H0ZJ/Brc6DaO9efkLIRqZ7VQVIt2ahIgZuQld5aXJvN8ECVMVIVyPKeqT7+bUOPRvUUR07OAe1PlGvsuPQSaa/ohmaTZo4oBtyTrx4jFxBO97vHxlK3//CFliJO1h2xIDAZJMlD3nzL8pAd90TyOm9MWqZ/DA9rxM/CxNlmyWOG0XsA1uFNvGTJ7mhW1WYs8ZxWNO9k6aZZIyOgGbMaUh0QMuyQaaPVBiBctLClaZHt+ySRqr9cacaf/RW8ffI6B1tppFm/c56xMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X88HHDrIrDXRi/DjPOIADPxXH4Ksd75DPA6M95RjgfI=;
 b=YBidhhLbiPF2wniWdyD4+C5MTYKL8j1jbVyLfblsiGELyu+FfjrK5viLWbCNtuGL3lE59eV8Dn24Xq8HeuxzFayyqo0+i0MlNVaUQgL3U9E+nQLmIsaf70wwZf4JYILSwld15X8Z0hS4APRhjq2Nws39Pf3RSALHHmTlCrN2uKinbfFEDl16dVvFMsCkLeGSO1CtC8dGECIktSvu7vyHEBAr6xjSuXJFgYXs8LYDtSd5smnBqh/ayy4L94FSFtpUxS2Odz8w8SVZhRYA8pv3mjmrFtda3+hBdINGEq0sYUksYhPfzL5IJIBfCbWfz2GgoOfhysYRiqZ9jLIIIaH+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X88HHDrIrDXRi/DjPOIADPxXH4Ksd75DPA6M95RjgfI=;
 b=nNCGTHR9LHqMvvf1H1XDPdCtrTr0o6PvkUOE+/HWX7DAgZBsc1/0AOREdxSWBl4vYsx64KGIFAw3GwqzRdYe3WH1YfCCblXBnHRo4SLo3iHH0sDyUL104ezV8Op/ts7z0NBv+qLyVFU5czTYOoo4DtgObeku5K6EnEUMu5XYQqZkvYcSJq2KpD0zat9GbwA5e+JrMzdnsiDbqCePnYHqv9/4FWgm21q8GB8al3cKLlwF8U9oPEa9JTsw3/LzcgFOv18NvhKqtjrTBZ32jJVUU+380EaBN4cGfLoYJSZUe6G2vUzZEHL7cvgRnbmOeSSueDV7CAsf1Kxx6d/qmy1GlQ==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SA0PR19MB4222.namprd19.prod.outlook.com (2603:10b6:806:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Fri, 9 Oct
 2026 16:28:41 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 16:28:41 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: marco_giunta@outlook.it
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	mpearson-lenovo@squebb.ca,
	sunweiwen@awinic.com,
	yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: Re: [PATCH] linux-firmware: Add firmware for awinic AW88399 SmartK AMP
Date: Fri,  9 Oct 2026 18:28:31 +0200
Message-ID:
 <SN6PR19MB23038382433F3829DF3E0301FC922@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2@BYAPR19MB2293.namprd19.prod.outlook.com>
References: <BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2@BYAPR19MB2293.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF00000AE5.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4b3) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261009162831.50151-1-marco_giunta@outlook.it>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SA0PR19MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c3d051-5c57-417b-d4e4-08df26226148
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|260925184616899003|24021099003|23021999003|15080799012|5072599009|19110799012|51005399006|25010399006|8060799015|440099028|4302099013|3412199025|1602099012|40105399003|2607281247196008|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rSDxwRl0fkQpPVHFAMSUZ0Jx/0S+c0vtjmrGvqbCF9ze9ZZe85cV1A+RZ1Hz?=
 =?us-ascii?Q?klvlis/uDf18/TlURiBHpHg8Wf5jz4MAv7zIaFZ5LQcbjjOcHSbJLl6J0QhF?=
 =?us-ascii?Q?vj1iopVIBUNSbhvwEn8r5YV1jR8GWb4G8A9lLtoWXy6lca89uPeg2kOTQoN/?=
 =?us-ascii?Q?v5o2irdpSVrj+H2SQT9JkeNfI09qX+yOAPFGpyPFcQBKGqBUkzPSkad4bqLg?=
 =?us-ascii?Q?XJ/4tyP+a8U++hg6p4dl18gd+dP4yOJmMj0FlqvpYfz6a/Pwq96SkPNp6bnq?=
 =?us-ascii?Q?Cx7nwa8JFe8w+XWVyjASyBvbdu7gix9WJau8K3UAOY2uf5gcA1eiYv0fdIIE?=
 =?us-ascii?Q?0/kv29EhLQm36IVcPArOD9GJ1Ij1lQbqXBJCXmmuFxs9h4QsLCvj2mabtEWT?=
 =?us-ascii?Q?pl1+88srFHxvYQ6RqbrdX60NDG4sWIXM/+biPxuc+Q0SReUsDsz7AlSEjn+6?=
 =?us-ascii?Q?t5OJvsniBiJH0EmMGjavGeU3JcWbJe5w0cGmeDNPr7gyA6Ms4HEaU1V3rYki?=
 =?us-ascii?Q?7jU98lgrHixtjYsKKdB+eBJSatabyzdGFzYHINAJXVx8Qg4sg3segAjOi7dG?=
 =?us-ascii?Q?7ZYMRaLpM+TKZBp0r0AoMLoNah/Zjtxxl3tRRGvWah2YDYf2bbpawW+i0cFa?=
 =?us-ascii?Q?1MrURGtA+yPcK4un94POp0fKw7JmYaLzMSfjkFkf510Nd9LtJu5FmStUpPSg?=
 =?us-ascii?Q?qrAyj6wGRGm1m1IqtA0GV+M4/duVDx+Gn047fb0Pv1HGa+IKxdCgV1N3xr+6?=
 =?us-ascii?Q?iKgLvuGsdjOQeOK0T/1xub+rCspYI5RffkLe1WZU3ub6ZpQMH4SinKHxsYLS?=
 =?us-ascii?Q?oxb7BNj5CBVkpJJjrBgGYJ6uXq0Cr/hUUfh6WsQDx4R0vUjunOLVdAWAWh+N?=
 =?us-ascii?Q?/hGr55wclQLmrABUOmujp0MMTQWE7okXvfuOwmXJ8Vs8qBdxQ/CdxCQduh2w?=
 =?us-ascii?Q?6oXtzI3OyayszZ+9OHBeRkQLAcXdOoslvKe2zozW9WixgZLQL0v+p7FDkNw3?=
 =?us-ascii?Q?yQJK?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOgNsApeRC3SrN2K009KXJ1JXUhMjY79p3Blqz3981O7Rr5d8Qv+bW4TSUF7?=
 =?us-ascii?Q?3B4luSs6F3VW1pggdBa2UvCANU7hDcARg6ZfPyugbg+i6K3TpXZHCdzWa0EK?=
 =?us-ascii?Q?A2gLsqZCOJFZMAq6TUoTMJPGhQp5LMaHgHZJ9WEvzJo2PveU2Myba/rGrpW/?=
 =?us-ascii?Q?/fiDJ8FqlQBMxzd/N+D9C1vhTKztFmXglVVHCd6lV1CiII+dHbVcR6fcpO56?=
 =?us-ascii?Q?5oKi30Xzn+CvscQ7npZo8sOnbpNi/EU/BdO7UryEV5AWbGwCotA6IFeYMVjl?=
 =?us-ascii?Q?fgs6ywdWFcIei02WlnEAosQMj//DK6keasPKpcKvyXOHQ74Tr/L0nijYP4cY?=
 =?us-ascii?Q?QLlkpUSKrqBtq6SwYGzDmpAIXgBLBw2A4hFPfguzCSCKaY7hqf2cJJpbvVjd?=
 =?us-ascii?Q?rdUE2oHJRJbM25URapKyHu3qD7f+iEC5AmuBonBYlODZ7ov56iC/iIyOiwQP?=
 =?us-ascii?Q?YrxjKYcOIc54XbtCpVeDcZuw0Xx/lgXrhcwFv/WVhWXAJvYV/zO9QRcrf+Rx?=
 =?us-ascii?Q?tAObVDsszG8QEmC6aOv7NF9Kh7GgXBYPVTjqxi5lFDVrX+HsSCXCydLhDP58?=
 =?us-ascii?Q?ZT25c0Y/QzyJQtE3pGUBR/19edkb8vZPaPulwc6XKYtGNeNSY+NJzynn1cXU?=
 =?us-ascii?Q?M95PFZIxIpbhMcUorjyjOD0h8UlTADHwuZpwibi+E9a+J0KP0XVkAyrp/Vqb?=
 =?us-ascii?Q?wT9fKf5kopcY8WylvQewXzprksePYGNXrgP2j5My2Vlv/DOVmXXNzjdvFYk1?=
 =?us-ascii?Q?Yo/nzmLel+Vn7Hc1R5lOh+AFvB/XypkSiwmaSDAcoYzWAaCOsfgQR1xVhJtk?=
 =?us-ascii?Q?gxCEhb5R16L9BeE69I6DpXZUtzp9ggPU1lxtV3TEhloiuOkePCuhwTIEeERS?=
 =?us-ascii?Q?vHBpAFV5wHQyW/fSWB8Wz+Nb0roAvqj1PmgGl83fDaihueif0ert9Ezc6yUl?=
 =?us-ascii?Q?6Oi22oFrOanvnQiEooT56I40jvlzKz7zZ+/8Ya7qiO4FZzmEH4bPJd5p+REB?=
 =?us-ascii?Q?3FuNgZu4QSldVvLYuwsoKx7m94JainCgGlZiU07Miqo//+XxfMYJM/r/hQj+?=
 =?us-ascii?Q?92VEQ/RGXW2IWrNE7IUL2wb/m1VjbKwlPDwRJzUz06aSEBk9gUHcugQ1ocdZ?=
 =?us-ascii?Q?clNagRVYMftDAK/xWqZvi7e/glzfDKECN2Rd6nlYADpoCQb4uvkGlRDE7Tve?=
 =?us-ascii?Q?KWUX8suHZWn7DOR+5aj/t/QXBsXuftB3Bs2luHMuOvl7BNSUfsCf6+Ug6Q4r?=
 =?us-ascii?Q?b0etEPZgGKvJxwHJoU3b/c4RGApwI0mcJMNyJtpTjphAzMnya80MCPj5X6fB?=
 =?us-ascii?Q?WiPmMkNwa2JSb5E0tSgOeH1gzVy5+kAJc1GFlV83b/ONl6wVkslTzb9EpdJQ?=
 =?us-ascii?Q?5taYGOh92rZeSsZ3E2a7DpM62gim?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c3d051-5c57-417b-d4e4-08df26226148
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 16:28:41.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4222

Hi all,

A new Lenovo Legion model using the AW88399 has been reported since the v1
submission: the Legion R9000P AFR10 (83F6), with ACPI/codec SSIDs 17aa3934
and 17aa3935. I have already submitted the corresponding kernel patch [1].

The firmware binary is identical to the other 8 files (same sha256
checksum). Wayne, could you please submit a v2 adding:

    awinic/aw88399_acf_17aa3934.bin
    awinic/aw88399_acf_17aa3935.bin

This way we avoid a separate submission later.

Best regards,
Marco

[1] https://lore.kernel.org/linux-sound/SN6PR19MB2303D726352EEE508A70D6D4FC922@SN6PR19MB2303.namprd19.prod.outlook.com/T/#u
