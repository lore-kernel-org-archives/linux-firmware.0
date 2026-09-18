Return-Path: <SRS0=qh0u=HK=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE62C982D7
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Sep 2026 22:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DF141F00898; Fri, 18 Sep 2026 22:46:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.24
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789771584;
	b=FPS9SmHD6+eTAONhEuqgUec8TQPa+1O7yw6qYqih96nKcLx/TWAAyOB2WKeoZrw7Tha7
	 ReezWufrzfwCeNw8NrLi8doxJwzoxHSnop8uM3l68C6QpCFGxKE3nhH6UA6UA23phOGb4
	 pXiTJiDRbTSvc46d911y9r7hP93aTCqcTgNagm5VbsOFfzTpY4mEuFb0sAV2cA8AIqpo7
	 YAI13/6K7mEEcyfjyvhu5y6NBr9lQo5LECb74qjXc+dAwd/HpAZH03U8QZKGbTlrHOY4Z
	 Aaug4hH5H9+QdDwYMicfDABUfwMdTdXiw9Mn/ZwqVjh020R/5Kr9qGiZS2GeoxGvCjw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789771584;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+S2ExEkgQcSmMS2F0eWUENXxiMXGB8TdET/NWs8KqLk=;
	b=HUXyAG37Vm9RK8Uc/3tzzw07OLMl4HEk8lft5BsIqSwDv0qJEiBxBB60ORSZFA+QNzR4
	 xQSrDqhigL6Q59puXzCso/lnwosAVBtmb/O5As66zDMYk3CibGzWxRyICdY4L7wKe+0W8
	 mXMONbHtQYtdlf3tpn2L70QSub2emvS6zdyKw1OTxqIKjDgjRJMQp/S56sBrCg/xY2Oz2
	 Es//wveGisAH2Shb4pRksmCVfwIeVQOVh4oP924Ku0/wHLHn1Iuf2wU8p6wViUeUDllMk
	 StnB+7I2oM3U/YYWoW1S9qlWl20QkaVKADAguvX3dGENqYUASLHCQmJhLbLhbrpXenA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=04q2cPl8;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.24
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0D601F000FF
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 22:46:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=04q2cPl8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E0D601F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l03n2jJKuT3sCu581ouoU69IKAYZMoSZMgP1DfbOXNX5aKM4bxaeBHpUJLRdlLOQMq1Os3dTYL/1JQOqlcKTggLRF6erB/6gZ+JXeyMLbdl3EPfIlwZEy8wejc1PzE57UeDjUL7OJ4YwD4RxvxxMhaAnkOdGyaTezzEcuX5S2W95WTnV/KSopd5VE1pdRC7oXimIYGCRaHJZ1ZJK2Hd74PtnqPiSSTmuL+QWzwVlS1RVQ/T7y9SoeRMS3lJ5tgEyw30NMeYEpAoVn27G4ZW/iQuIBPtTnWyGE6gACU/ZXouf1HZXrjd8V4LG8JQPzfas3SNapD2/8V2a3PLfkKAqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+S2ExEkgQcSmMS2F0eWUENXxiMXGB8TdET/NWs8KqLk=;
 b=y7A0IwNrHYrRNFXY8K3tqeyGO2tcwYMhntDHslg248S1JuVs1dD21SCzt2OP2hGK5m/r4VteHsJTw2ZbL9e7o94q3V3qeqjAF7Djkn3HNEm7XgZ91KM07aQvcWTn0Ns9XiIEfU3wavop1NLd+IJ+//BWy9MELP9WcaY3fitoECM9HqyabeZgonmNQUFTF6vUlqzCyd5n+TwhnMVteVlWuKKxkaU+ZRBN39KFFOHdMuXBK9VjjQjoMeO+4A7rUD4uqiLcuFAqESjaOVSI/TOfzsx45koiwpai/GiDvYvasuEKnXVeDG7jw4V7wl8xeA3niifVIbPzei7aOQfZ0iGDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+S2ExEkgQcSmMS2F0eWUENXxiMXGB8TdET/NWs8KqLk=;
 b=04q2cPl8PT172f2d3M+WCZZ28Iyhu7+qq+UYwoRCLoOCOxKVHrhT+rdfZr6soy18ZapHYUr88jtNCIVl0uJO/MRjsIvI1smdYmsHCWYFXpVqTe5ZIfJE6rm1wm6TfLO3j4TakulyMl8e57MYy321zSOZCyTGQZUzo39S4mfKwvg=
Received: from BN1PR12CA0001.namprd12.prod.outlook.com (2603:10b6:408:e1::6)
 by PH0PR12MB999087.namprd12.prod.outlook.com (2603:10b6:510:38f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 22:46:19 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::a) by BN1PR12CA0001.outlook.office365.com
 (2603:10b6:408:e1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Fri,
 18 Sep 2026 22:46:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 22:46:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 17:46:19 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 17:46:18 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware update
Date: Fri, 18 Sep 2026 18:46:06 -0400
Message-ID: <20260918224606.959586-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|PH0PR12MB999087:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a85e4f9-a504-433b-eb5c-08df15d6a7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|11063799006|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	uk1vz4X0ideBEOMJfA35f7zMWaNwKNjIWCS6dY55o6Gi5wYTxQYk200HqOQJfCAzptNOS75dD0nwMgnRQoIkIQcRZFl5hMGncWhyT5Ewlso2o5wsmUrD558gdGtLiegV4YvtymupEs6khvi+ULNGHRt1yDCvtEQ1ZMcqxnJ6B3QdEZhSwUGUyvSkh6pAHXh5aQ24tJXKv+vcRZaOSQaPUKalEy/hPba+f1/B4gnKASeWeIW8FqfPb3fCx9Tp2SpCgOJIbzxG71dDgJ06dn2d1WcF54hE7PW13hulg+61UNHEs+yPMzK+HNl4APwlVracXSu8wyKP0W+6HgMdr5hWEGoLGqGRetbdgBO0T14cIcAZQ1fOc5v7uOI/zhBpW/0g/5ml0FRYBI2dkkA4sNpZMh+RM6FdGQoFFE2cZRWFnE+KaP/e3YlT5MzO3TLqbKc1vbK3a4dEDdZJcA32wsoUFVh67VD0OXoVDcAaJtMCLc3hHydBYfhghiPFDGO1ven/TMF6oClHAJl5aDOET98sty3kuCIrZ3Y/r7enWUCiwmovvS72xb6pCUr3v/uN3Sdy7Rv8JpZLB5Zq529mK/EuyRgpDb5S243Iv5OFOirvlvcY6og10HJjqX65IhLPjxxpL9tev3VwsvebKCo7F3W5Lw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nQWFT3JmdMh3vMKD9kpZA+oQ+u4l2lYRUwkp/+hGJOV2rhq+eUgbrY4zxT8gKfaBbpM/zwEGQCxgYS3p7Ka0drRDZk1Z6Tld1g9zlo9rxZJv+gJL0s1W5PFBB00QGBm4q1dYuU33oFgDl4yGMOJkw7Q9ht7pGPz/slCrO1/dWIAaLr0t+dcWC25y/hotqQzDqBvlXTHtPnWp0jLXv3We05xkwXZ6iFe0e/hiHMMJn8yJJ4G/NOH30e0A2Im6sV26e887Z7Um5JTbwR2YvvZYx4LCG64s2ya/JBn6WxHNuE6pXDcB1hL+gMYjo8gzozlIjUcKSlC7HRuvgnjWkkUKqZuyj0q/eKWRvv2boLkJ1Ou+edlMnM8VTxiTkfFDuxO3CE0DrdFoIOWnrtbukrttra5GQ5I5AhbJnSlVhpl1OTUgTefRhkzjmLGfe+nM1GJl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 22:46:19.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a85e4f9-a504-433b-eb5c-08df15d6a7f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999087

Hi,

Revert GC 11.0.0 updates.

The following changes since commit f5e8adfa1e0c2af7ac13280fdbedfd48f37e0c34:

  amdgpu: DMCUB updates for various ASICs (2026-09-18 17:49:24 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-09-18-2

for you to fetch changes up to 3d99cd46c54b99843d75ef9da22e89c5a54bb4d0:

  Revert "amdgpu: update GC 11.0.0 firmware" (2026-09-18 18:37:33 -0400)

----------------------------------------------------------------
amd-2026-09-18-2:

Revert GC 11.0.0 firmware updates due
to instability in some games.

See:
https://gitlab.freedesktop.org/drm/amd/-/work_items/5711

----------------------------------------------------------------
Alex Deucher (2):
      Revert "amdgpu: update GC 11.0.0 firmware"
      Revert "amdgpu: update GC 11.0.0 firmware"

 amdgpu/gc_11_0_0_me.bin    | Bin 324064 -> 315120 bytes
 amdgpu/gc_11_0_0_mec.bin   | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin  | Bin 221120 -> 220480 bytes
 amdgpu/gc_11_0_0_mes_2.bin | Bin 263696 -> 260624 bytes
 amdgpu/gc_11_0_0_pfp.bin   | Bin 234960 -> 232096 bytes
 5 files changed, 0 insertions(+), 0 deletions(-)
