Return-Path: <SRS0=YL8M=GP=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A791EC5DF94
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Aug 2026 02:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A63B1F00A3D; Sat, 22 Aug 2026 02:51:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787367089;
	b=N5p9OftocRmkhGgUDPfbdQcjhbnAVFVooF29I/QP2OhKFrZZYOfMZqctR4yJUcs0FcGj
	 q64S48l5zb9t4BDax6ENTCIIhmfI0F+pEdJDsL8IwX/CoQgG2tzpXW0b/RQmFVtDmDk9Y
	 dUE816YLwxlC+tZspZ98DEIK39MnBdNwD321UuAS6jAImuilRYuaOYz8ZfsVlZNpDCJ+C
	 h8XKxXDQvD4dMapVolPGmJFvwkVyNa7iHYnIIYB4owqBWNdroBixwrcGomVQ9ojZGj8SA
	 fOvvebDZgI3OZdolfUGPfPIrfMPV0D+DwwOu5cH8l7hOrzj7HJBAzwfiIzj4sZqbxIw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787367089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:List-Id:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jRK4+w9LwDAAbeTOR4tcZ01g8HtYQkrtz7XQKx/Hz/E=;
	b=iS0tGIMHToozcqabTRekfn6rdbYPtJO+gJy0RrUSXfvNz3/zxelY2Nkw1Is0e3OcrD+f
	 UOXZSxdo/PFI3SudYaCC+RhcSVh6vekc6VC9uwdmneZjtGPghaH5JpjYsSx2Md3gKNttk
	 ImL6RvLoykePDzsLLeoOz8bIgSY1ZIoXO6tcqQWwVk9RFCkuM34V872YRKjaipeHbw7a9
	 J2PaX+Jdz9B/moeM2/4BJAaS0dC93Igc2kdJcydtHMEBeBznI1WMkcquwj8RkeVSE5vNP
	 WzhQVjckz2BZTmOoyMyZF/Dq9QuTX//VI6eO+wTfszCdSfdx/jbsz3oKF46WQ3B7BtQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pXY90VwC;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=Wf3ennnH;
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D4061F000E9
	for <linux-firmware@kernel.org>; Sat, 22 Aug 2026 02:51:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=pXY90VwC;
	dkim=pass (1024-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=Wf3ennnH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5D4061F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67M16Dei420620;
	Fri, 21 Aug 2026 21:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=jRK4+w9LwDAAb
	eTOR4tcZ01g8HtYQkrtz7XQKx/Hz/E=; b=pXY90VwCQ3mweJRKXcDBzXvSzdItt
	CJ39CAmTbsgZqSliTLE1GDJmOrZ4XyrH5poE07yCrzPg2RcKuOZ/U89Rn58O2rEe
	YaZ+i0MhrHJslC0CDmLKVE9L/+PaaVYwxdhihm/TWLyUtN7Gwx0QzcKK5zFEXqKh
	znk/jC7sii0++zEZsRwYo24pfspymeRUo7hp+nvaFYeLSjr4RwRNV5oeEXpKnoZm
	AQQ58ERJxJbo1SCbCErFBaGRWcGgBzmt4KS1EsdeaIzbOM9Sk7G/wkLJPM9QQtBf
	1LsJBKjzj3Np0iBV1s8k6CPhgGyLvnE/H/hUjzCJ/4hS5VbLbNOWJx2oQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011027.outbound.protection.outlook.com [40.107.208.27])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g6gke5hk4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 21:51:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETaxmrh9n8d1kpdMR6XpOhixpqZ95Gj/mwmFgIMk++c87WojR8a5A1JLh96LX+Y37pcjX1ywzJgKlOhYY9/OuDgzLC3RxRAQTSqUnwi7jTjZdLjnDqMcnSLbNqJ4CWyiGqjp2pNXCj+ikc34bn1pcTk3MyRtZz8JMBtSJoGiS4T+rA9gonjesOQfjppFtsc8IwlF9cJDRSyIdgyKt3NbPkNBbB/Y1nHDbj3r40UAObOAgdqq1NiJ6n+gwgDJr5pWUaxSxEIbxNC6QX2XaEdM8vgziQ7F+m2MVyLXY70ARm/bgcmyyafvDBKfwoWA2nvOF2BfNNJM9dVIhar9/cmjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRK4+w9LwDAAbeTOR4tcZ01g8HtYQkrtz7XQKx/Hz/E=;
 b=VBU+Qm3oEbnCA7KQJyPIrHp1KG6reXdxkyIAMMI6P8SfrHGlaeBri/nmjou7XDs16ma3bzeRMNAj/PmG6Cdw2Weu+Y5wIAUlTOPFHLsfdJD8of9G/d/xoau1vVMBPWZzfE46l4H3ujIqaoySmLkrOku1pkKWNtEoENmoYR4AkipE5HoTi2QvUFWXz99+apqytrSxYAlHa8/KenV/KhxCAkqCl0xNLskWycG35MA9e123TrcKI96CegfLfeiQop11qHs4qCmIiWhyWvsr5K43ke4sYmOmMTVziNsKHcICKcjsi8YVQxr0EZzGXZnU8DRQDjSDtDku7BMaGW/SFGrfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=qti.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRK4+w9LwDAAbeTOR4tcZ01g8HtYQkrtz7XQKx/Hz/E=;
 b=Wf3ennnHTjLCAFObKCYxSfa4bZf6NcXV0x8ikmjW4NnAILMYMkGolxM1gnv9uGDx+wJDn5nxd2WuRMoDJ2o7W3wRDZ2hnx+obq/idNBMEo60jGIiP6GkCnGMJkdOOOpZwDB1LyrCrFUGpftjOnKRzOu7h/Z5MgrGtj0OZpoSpvc=
Received: from CH2PR19CA0013.namprd19.prod.outlook.com (2603:10b6:610:4d::23)
 by DM3PPF743D15148.namprd10.prod.outlook.com (2603:10b6:f:fc00::c30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Sat, 22 Aug
 2026 02:51:15 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::6e) by CH2PR19CA0013.outlook.office365.com
 (2603:10b6:610:4d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Sat,
 22 Aug 2026 02:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Sat, 22 Aug 2026 02:51:13 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 21:51:13 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 21:51:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 21:51:13 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.224])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67M2pATi018077;
	Fri, 21 Aug 2026 21:51:10 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <k-lu@ti.com>, <baojun.xu@ti.com>, <13916275206@139.com>,
        <mengw@qti.qualcomm.com>, <honglan@qti.qualcomm.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1 0/1] linux-firmware: firmware patch check report
Date: Sat, 22 Aug 2026 10:51:05 +0800
Message-ID: <20260822025106.211-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DM3PPF743D15148:EE_
X-MS-Office365-Filtering-Correlation-Id: ecba650e-9632-4bba-b2cc-08defff83afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|56012099006|3023799007|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o4t3zxwke5MRtYcWzudTeSLOS1KGJxq+dQDz6oTdAHpz8woVavMr/rXrWhWDuzpHc+vyBWbBQY9uFvDlnB5eB6zyualdxfGwlhmd3ZdffmwLT9CZKWpBhkUDg/fwZIjQ2VTlNDENrSY9QoyU6znFpMB3LsHX5I+fGcHtLIWImqQQuv9ANHF8N8LOngzilb+Ew/5xMy8FPfp61YacQzpO4zs6J9KdBWqIdYTygwxXCcXIXWGvPCrG8WOVNvb4impXg3iMjFSPYZ3fd7yal7yV6VEdmDnGL8TtQDC0+r9Xx4flmrzaZXlJ35mudvR4yiAp/kREPWO/SCKgmk53DjzUs7Uvxgppz+ZtwVus1OGR0m040JT52XLl87Hj4M5kuCGTs297TrtgEDv+ViYxTnlyitWGpcn2SSc/VL+I2nslzwZj0uCPdWqUrfbeZnbB3jnxgb+W6C5cXKeTmOHWvgEBQj+hiZuraCylHYixeDJSXqPtAQRVGVcmUvqCb2DN6F2gLN7La7E1BbmkgFylGXG1tn47R/RSNvbz3bpjhz63nk31epxIpu8g2Mayz+cyF2q9qRekO5Gb9YPpJdOGbLg4fAlTQJUeNBzQ1Z9YQINjUDtEXMAGLzatiQOcQfk7CTVBe2z1za0IMdikPuv4d/erUdgoJbyZQC2XJbOgj+1GaYLLKbKF6yneDSW29FEDSkaH+Jg1QOFu9uN8V7X6KN+RjA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(56012099006)(3023799007)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TwuD3URwlAoKhc49gUrnC4bH1YB7zf9QJilcTUhDRLa6VJqtu/rbX67gG1zS3z4EF1iP9rtFPJplT+IuiqjdzEXDxexx7aVMwOThcxpEhD1UrPPxwVHkyErFz0vlRotHqpBMEdXpfebVwybAkJWarjpywysk+uD1iK9Rz0+6FUbRG6FYPhYeHXdVEMcZMBUlM84wSUj+LuTMfMUzLQiQS0567696SXSW6UNfIWuGO/M6JCz2asyr0hCXZBuGD3G8zNbosY/3p7OshiudDTKppjJmYO6IfgOmr/Zk8H8CYzc/BhM01deeLm7FJP50TMW/XBX4KeCpnLOlb2WhtvKwVniB8lVwBsQI2t5MGmG550246LCYtrdiUgMWtoF9aN0rXp1Me0i9TyRM6i9tsgPAec1vJQrb/4QFxZG4n3wvzmejvXG0vnlsoclY5Gpr+LOs
X-Exchange-RoutingPolicyChecked:
	jDm2WM5D1nf9tGJa8H6FJkTIRUcW1szKLdRNquOEV54kfDOp1yUBMVqR19qW4tENOeeCge3s0FiZaB1GO5doGAUVYKW7gIXwDagK7S8mgVIL/lPXqx7M8vrFiIFYh1Wyds5hJXgYzwenzKuGrHsjS80nycf2IqGFsBs8sqpz9oWJmRLAoIFu2PfRaOKMjLiTMbrC1HGZb+h6pGuzpivZsUc+ZC7TpPGmJAGjHZKCuTAUyurHYRpXrLFk8XjLirfKKcjhAxJ3jUgga1xGzsF7uCrucye9x1yOvooo508TD72RNQ9NGB/wvrcB+OXUPMW+PJLrdtM9inlvBqjuZv6o4Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 02:51:13.8718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecba650e-9632-4bba-b2cc-08defff83afb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF743D15148
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDAyMSBTYWx0ZWRfX6/SPA6S71YSS
 DlkAGgevgeGKPaMybkumnNOvlJtdgQAOt6i9xm3iqijDH1GW65nfkZkpA1U5c0SuqK+0KvuZIOU
 yJ1vvA/EAQ1H9GDrC8nHAl/VOG9jO1I=
X-Proofpoint-GUID: NtHAKKFxUUgVYHq6c7JEC34lyrAYBxhV
X-Authority-Analysis: v=2.4 cv=Fp41OWrq c=1 sm=1 tr=0 ts=6a890ea7 cx=c_pps
 a=iNm6N7YJuWyXLwPauF+ZSw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=ThYdwig5fDgA2bA1BDMA:9
X-Proofpoint-ORIG-GUID: NtHAKKFxUUgVYHq6c7JEC34lyrAYBxhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDAyMSBTYWx0ZWRfX7s6Gv3bt46tf
 meBbGHLjd2ouxd5n5epJbe9XLffd9lv6UDXchBeFA6TDICwURYUkQ19dAAVG06wVGucccyAjo+R
 5CXZtp92tBSqwBK7MnwqvLA1N38KYzH+GhVlt2CEsaIaYR5SM4ABVAnsjlmVwn97Fp5JN8U9rfY
 3xE7thbIIP1JtLTHJerKUsKbOwhEMBhJja22mKbIsp0VJY6aaV1ZTZlRdFnM7F3vhVOAgQaf1kN
 4wEhtaUKeO7dSsZ/YZFOJyctDvO8+aEtD2pcpWdhIizKIt0TTxSeGukayuWIZGfbqrBo6t2YpTz
 xjp0l2v83RaQB79ED9Js7zvM9EiBCbgo59om0+n2pqsyRR2/bVhRRUfBLYkhwQQ7+YySlXdNwVK
 Oc+FVEq7ZHU1km3+XoSTuvWxLNNKVRrwWu3P9aQNLKgKfbXCylDWeXzGDl9n6GlbLEZoQlWz/C2
 7kBnBN/WXl1Zimnn6lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220021

Check that executables have shebangs.....................................Passed
Forbid new submodules....................................................Passed
Check Yaml...............................................................Passed
Check for broken symlinks............................(no files to check)Skipped
Detect Destroyed Symlinks................................................Passed
shellcheck...............................................................Passed
black....................................................................Passed
markdownlint............................................................Skipped
Check whence.............................................................Passed

Shenghao Ding (1):
  linux-firmware: Upload firmware for tas2573 stereo

 WHENCE                                |  29 ++++++++++++++++++++------
 ti/audio/tas257x/tas2573-2amp-reg.bin | Bin 0 -> 928 bytes
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 ti/audio/tas257x/tas2573-2amp-reg.bin

-- 
2.43.0

