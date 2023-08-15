Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857BCC001E0
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7240CC433C8; Tue, 15 Aug 2023 18:00:55 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFF8AC433CA;
	Tue, 15 Aug 2023 18:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFF8AC433CA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5NPjE6m0S/mtIKtrr95WXHCdtGhrTlXv1QSHPBs9PA4gcJiLtnS3meppPpsfAOG9Fk3WTGWPphjyZ9JuGnD8d36Y6L7QFhYxvCG2dKUM+sEWjd/0E9CBf5b3aQp3ky2wSkFpTa27WtK5Ew0ywRDjmh6wwEdm1vWOMEcOfSPmjDbdbFQn4XOzozDJ9zVb1x64J3rnVzDUn2DDeK//AqFMq4UveMS0HfCHgJKM9dWPqv7LzT9fiJ36yOrETJ8M8XyuxdQizdrK+zeCMQ2IvJpJsACk7H1JttnL9zPvPH9ERKd5BX98u4bMKgRn6wYHdjkMqQv31urBVWOjHfIUWqMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi8v3+QZkTHkNaN2SJYXNcKKekdi1Jqzdp8EegE8zd8=;
 b=HjbmxEfKUjMQrgp0C7wBdn/e6LkQZrPAunvd7MrOr1FlygdJlZNZkK+d2MgM61aHtRLcF2i596RQk6KFmIAz2Gm81z3S6rUlDyekPBozAbKm3kyY4d2exJa8hOZHQ1ETsF1BXhZwgg81mRHqF6eDq+RnxEbvyEm6FAtEUWg7W5/1O86cpw2OhAHx3PyBaXZuszWyEmM5aAvn7aqogyPdqZ0iQLr/Irux4Xf71n+NZEQuzZzxdPHAH3VanDo17nXqEM1lYkaKISM/UvRMqbcrIfIQNAflVEgPnptCLosAEyfk+ho4OIPPEjVaPiBxrMz0lpzkEuQUsvuFKR6RBEfZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi8v3+QZkTHkNaN2SJYXNcKKekdi1Jqzdp8EegE8zd8=;
 b=EvVgL8Y78voWhPbt3RmlsLVR3pN+4BLUnqnTW9rzPsJCJ2LK7UgxHxSqayFsmVqitKoQZ/CQScONWC4btiJRnSyClF0xKpeuAmlLSHEy5xflPBFGzAkt5sqH1PGz8arKpIdYVUgkIP8rZga3Fzbsbm/NIgVwJwYuAEicGbrsTcI=
Received: from CH2PR15CA0010.namprd15.prod.outlook.com (2603:10b6:610:51::20)
 by PH0PR12MB5678.namprd12.prod.outlook.com (2603:10b6:510:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:44 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::6c) by CH2PR15CA0010.outlook.office365.com
 (2603:10b6:610:51::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:42 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 16/20] WHENCE: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:14 -0500
Message-ID: <20230815180018.25554-17-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815180018.25554-1-mario.limonciello@amd.com>
References: <20230815180018.25554-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH0PR12MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acfd6ed-87b7-4015-8f9f-08db9db98b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	95aK2TLyB7iOlP45dDfg6yVmux7eDld1ThUr4q1lqCt/ANwFK3JQAMvWYjSI1zR1G1G4nswZliHt9HZ6r8ani0KPQfxR8w4BbvnLKdFHsKeg33ZjefZgyyR/IyVCoVFz/pEy+7EifT8aNX/TYzZVyrNTQ/7U2jJhTjLz12cNCafDDXaJm0FMdIUuJx+tenVXeX/Kl8+j9oQJjXOwoQxfchTvLYHXjNFrnDpnx4AJYkf2mzOFuNa+JxYMQ6SpBThLkdGzlEv9k62YzB2S8z0p+IUvQyZ1PMtDwqWer5pxTkZEiKQneJJTw3g0dwK7PkvSbyNMrpDmzNZcur01o/8VWuxWTqYRm5Hnd6VUE3ThPpc95f/VQCZVoUyBvY+C9B8motc81gIG/l1zWmuJo6H+XRQDqZ6c81oK3LlvQiEXAfIrHCl1aXfMCaQyxloPfxOMJrkPQj32VOaIgVboY7W8wBEwM1s1vdefskD+5Z25EN9QY/deJJesb8oq3dLWdlQwhl9Xg+cMlEydnmbhho3sx+WyQ2Gv7H56wMN/QY+LU/f3vVRiXhA8EwKESflxJLULM3EUdTWYLvMzhSgtvKfV+uxZc2+6n8fPKRHBozcw2tqhpvEC7lXDMU4MnDEmXHbUOf+vELuOWl9tiL6pCdmEuRi2KNKy4pOR3UjsUkr20gJUL/1IMJlLeLnNTXya+N8j8DG31ZQgDLaA4dZZ2j5Eu4RlCi2DmLMd4tw14v2Z222kNI5KpTro3ULomdV4LMXLVpSCZOxnRfz6MEdELYct3ISCJ/ErdeY8uhAZ4/rUozlFXGoR52SdZX/eAhVZp+Sl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(2906002)(8936002)(44832011)(8676002)(4326008)(19627235002)(966005)(478600001)(86362001)(83380400001)(110136005)(7696005)(426003)(16526019)(1076003)(450100002)(336012)(47076005)(5660300002)(40460700003)(41300700001)(316002)(70206006)(2616005)(36756003)(30864003)(356005)(70586007)(6666004)(36860700001)(26005)(40480700001)(19625735003)(82740400003)(81166007)(2004002)(36900700001)(559001)(579004)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:43.3736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acfd6ed-87b7-4015-8f9f-08db9db98b54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5678

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.Abilis => LICENSE.Abilis              |   0
 LICENCE.IntcSST2 => LICENSE.IntcSST2          |   0
 LICENCE.Marvell => LICENSE.Marvell            |   0
 LICENCE.NXP => LICENSE.NXP                    |   0
 LICENCE.Netronome => LICENSE.Netronome        |   0
 LICENCE.OLPC => LICENSE.OLPC                  |   0
 LICENCE.adsp_sst => LICENSE.adsp_sst          |   0
 LICENCE.agere => LICENSE.agere                |   0
 ...heros_firmware => LICENSE.atheros_firmware |   0
 ...oadcom_bcm43xx => LICENSE.broadcom_bcm43xx |   0
 LICENCE.ca0132 => LICENSE.ca0132              |   0
 LICENCE.cadence => LICENSE.cadence            |   0
 LICENCE.cavium => LICENSE.cavium              |   0
 ...cavium_liquidio => LICENSE.cavium_liquidio |   0
 ...elsio_firmware => LICENSE.chelsio_firmware |   0
 LICENCE.cnm => LICENSE.cnm                    |   0
 LICENCE.cw1200 => LICENSE.cw1200              |   0
 LICENCE.cypress => LICENSE.cypress            |   0
 LICENCE.e100 => LICENSE.e100                  |   0
 LICENCE.ene_firmware => LICENSE.ene_firmware  |   0
 LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28    |   0
 LICENCE.go7007 => LICENSE.go7007              |   0
 LICENCE.ibt_firmware => LICENSE.ibt_firmware  |   0
 LICENCE.it913x => LICENSE.it913x              |   0
 ...lwifi_firmware => LICENSE.iwlwifi_firmware |   0
 LICENCE.kaweth => LICENSE.kaweth              |   0
 LICENCE.linaro => LICENSE.linaro              |   0
 LICENCE.mediatek => LICENSE.mediatek          |   0
 LICENCE.microchip => LICENSE.microchip        |   0
 LICENCE.moxa => LICENSE.moxa                  |   0
 ...10ge_firmware => LICENSE.myri10ge_firmware |   0
 LICENCE.nvidia => LICENSE.nvidia              |   0
 ...irmware => LICENSE.open-ath9k-htc-firmware |   0
 LICENCE.phanfw => LICENSE.phanfw              |   0
 LICENCE.qat_firmware => LICENSE.qat_firmware  |   0
 LICENCE.qla1280 => LICENSE.qla1280            |   0
 LICENCE.qla2xxx => LICENSE.qla2xxx            |   0
 LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3  |   0
 ...irmware.txt => LICENSE.ralink-firmware.txt |   0
 ...LICENSE.ralink_a_mediatek_company_firmware |   0
 LICENCE.rockchip => LICENSE.rockchip          |   0
 ...rmware.txt => LICENSE.rtlwifi_firmware.txt |   0
 LICENCE.siano => LICENSE.siano                |   0
 ...ti-connectivity => LICENSE.ti-connectivity |   0
 LICENCE.ti-keystone => LICENSE.ti-keystone    |   0
 LICENCE.ti-tspa => LICENSE.ti-tspa            |   0
 ...4-firmware => LICENSE.ueagle-atm4-firmware |   0
 LICENCE.via_vt6656 => LICENSE.via_vt6656      |   0
 LICENCE.wl1251 => LICENSE.wl1251              |   0
 LICENCE.xc4000 => LICENSE.xc4000              |   0
 LICENCE.xc5000 => LICENSE.xc5000              |   0
 LICENCE.xc5000c => LICENSE.xc5000c            |   0
 WHENCE                                        | 432 +++++++++---------
 wfx/{LICENCE.wf200 => LICENSE.wf200}          |   0
 54 files changed, 216 insertions(+), 216 deletions(-)
 rename LICENCE.Abilis => LICENSE.Abilis (100%)
 rename LICENCE.IntcSST2 => LICENSE.IntcSST2 (100%)
 rename LICENCE.Marvell => LICENSE.Marvell (100%)
 rename LICENCE.NXP => LICENSE.NXP (100%)
 rename LICENCE.Netronome => LICENSE.Netronome (100%)
 rename LICENCE.OLPC => LICENSE.OLPC (100%)
 rename LICENCE.adsp_sst => LICENSE.adsp_sst (100%)
 rename LICENCE.agere => LICENSE.agere (100%)
 rename LICENCE.atheros_firmware => LICENSE.atheros_firmware (100%)
 rename LICENCE.broadcom_bcm43xx => LICENSE.broadcom_bcm43xx (100%)
 rename LICENCE.ca0132 => LICENSE.ca0132 (100%)
 rename LICENCE.cadence => LICENSE.cadence (100%)
 rename LICENCE.cavium => LICENSE.cavium (100%)
 rename LICENCE.cavium_liquidio => LICENSE.cavium_liquidio (100%)
 rename LICENCE.chelsio_firmware => LICENSE.chelsio_firmware (100%)
 rename LICENCE.cnm => LICENSE.cnm (100%)
 rename LICENCE.cw1200 => LICENSE.cw1200 (100%)
 rename LICENCE.cypress => LICENSE.cypress (100%)
 rename LICENCE.e100 => LICENSE.e100 (100%)
 rename LICENCE.ene_firmware => LICENSE.ene_firmware (100%)
 rename LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28 (100%)
 rename LICENCE.go7007 => LICENSE.go7007 (100%)
 rename LICENCE.ibt_firmware => LICENSE.ibt_firmware (100%)
 rename LICENCE.it913x => LICENSE.it913x (100%)
 rename LICENCE.iwlwifi_firmware => LICENSE.iwlwifi_firmware (100%)
 rename LICENCE.kaweth => LICENSE.kaweth (100%)
 rename LICENCE.linaro => LICENSE.linaro (100%)
 rename LICENCE.mediatek => LICENSE.mediatek (100%)
 rename LICENCE.microchip => LICENSE.microchip (100%)
 rename LICENCE.moxa => LICENSE.moxa (100%)
 rename LICENCE.myri10ge_firmware => LICENSE.myri10ge_firmware (100%)
 rename LICENCE.nvidia => LICENSE.nvidia (100%)
 rename LICENCE.open-ath9k-htc-firmware => LICENSE.open-ath9k-htc-firmware (100%)
 rename LICENCE.phanfw => LICENSE.phanfw (100%)
 rename LICENCE.qat_firmware => LICENSE.qat_firmware (100%)
 rename LICENCE.qla1280 => LICENSE.qla1280 (100%)
 rename LICENCE.qla2xxx => LICENSE.qla2xxx (100%)
 rename LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3 (100%)
 rename LICENCE.ralink-firmware.txt => LICENSE.ralink-firmware.txt (100%)
 rename LICENCE.ralink_a_mediatek_company_firmware => LICENSE.ralink_a_mediatek_company_firmware (100%)
 rename LICENCE.rockchip => LICENSE.rockchip (100%)
 rename LICENCE.rtlwifi_firmware.txt => LICENSE.rtlwifi_firmware.txt (100%)
 rename LICENCE.siano => LICENSE.siano (100%)
 rename LICENCE.ti-connectivity => LICENSE.ti-connectivity (100%)
 rename LICENCE.ti-keystone => LICENSE.ti-keystone (100%)
 rename LICENCE.ti-tspa => LICENSE.ti-tspa (100%)
 rename LICENCE.ueagle-atm4-firmware => LICENSE.ueagle-atm4-firmware (100%)
 rename LICENCE.via_vt6656 => LICENSE.via_vt6656 (100%)
 rename LICENCE.wl1251 => LICENSE.wl1251 (100%)
 rename LICENCE.xc4000 => LICENSE.xc4000 (100%)
 rename LICENCE.xc5000 => LICENSE.xc5000 (100%)
 rename LICENCE.xc5000c => LICENSE.xc5000c (100%)
 rename wfx/{LICENCE.wf200 => LICENSE.wf200} (100%)

diff --git a/LICENCE.Abilis b/LICENSE.Abilis
similarity index 100%
rename from LICENCE.Abilis
rename to LICENSE.Abilis
diff --git a/LICENCE.IntcSST2 b/LICENSE.IntcSST2
similarity index 100%
rename from LICENCE.IntcSST2
rename to LICENSE.IntcSST2
diff --git a/LICENCE.Marvell b/LICENSE.Marvell
similarity index 100%
rename from LICENCE.Marvell
rename to LICENSE.Marvell
diff --git a/LICENCE.NXP b/LICENSE.NXP
similarity index 100%
rename from LICENCE.NXP
rename to LICENSE.NXP
diff --git a/LICENCE.Netronome b/LICENSE.Netronome
similarity index 100%
rename from LICENCE.Netronome
rename to LICENSE.Netronome
diff --git a/LICENCE.OLPC b/LICENSE.OLPC
similarity index 100%
rename from LICENCE.OLPC
rename to LICENSE.OLPC
diff --git a/LICENCE.adsp_sst b/LICENSE.adsp_sst
similarity index 100%
rename from LICENCE.adsp_sst
rename to LICENSE.adsp_sst
diff --git a/LICENCE.agere b/LICENSE.agere
similarity index 100%
rename from LICENCE.agere
rename to LICENSE.agere
diff --git a/LICENCE.atheros_firmware b/LICENSE.atheros_firmware
similarity index 100%
rename from LICENCE.atheros_firmware
rename to LICENSE.atheros_firmware
diff --git a/LICENCE.broadcom_bcm43xx b/LICENSE.broadcom_bcm43xx
similarity index 100%
rename from LICENCE.broadcom_bcm43xx
rename to LICENSE.broadcom_bcm43xx
diff --git a/LICENCE.ca0132 b/LICENSE.ca0132
similarity index 100%
rename from LICENCE.ca0132
rename to LICENSE.ca0132
diff --git a/LICENCE.cadence b/LICENSE.cadence
similarity index 100%
rename from LICENCE.cadence
rename to LICENSE.cadence
diff --git a/LICENCE.cavium b/LICENSE.cavium
similarity index 100%
rename from LICENCE.cavium
rename to LICENSE.cavium
diff --git a/LICENCE.cavium_liquidio b/LICENSE.cavium_liquidio
similarity index 100%
rename from LICENCE.cavium_liquidio
rename to LICENSE.cavium_liquidio
diff --git a/LICENCE.chelsio_firmware b/LICENSE.chelsio_firmware
similarity index 100%
rename from LICENCE.chelsio_firmware
rename to LICENSE.chelsio_firmware
diff --git a/LICENCE.cnm b/LICENSE.cnm
similarity index 100%
rename from LICENCE.cnm
rename to LICENSE.cnm
diff --git a/LICENCE.cw1200 b/LICENSE.cw1200
similarity index 100%
rename from LICENCE.cw1200
rename to LICENSE.cw1200
diff --git a/LICENCE.cypress b/LICENSE.cypress
similarity index 100%
rename from LICENCE.cypress
rename to LICENSE.cypress
diff --git a/LICENCE.e100 b/LICENSE.e100
similarity index 100%
rename from LICENCE.e100
rename to LICENSE.e100
diff --git a/LICENCE.ene_firmware b/LICENSE.ene_firmware
similarity index 100%
rename from LICENCE.ene_firmware
rename to LICENSE.ene_firmware
diff --git a/LICENCE.fw_sst_0f28 b/LICENSE.fw_sst_0f28
similarity index 100%
rename from LICENCE.fw_sst_0f28
rename to LICENSE.fw_sst_0f28
diff --git a/LICENCE.go7007 b/LICENSE.go7007
similarity index 100%
rename from LICENCE.go7007
rename to LICENSE.go7007
diff --git a/LICENCE.ibt_firmware b/LICENSE.ibt_firmware
similarity index 100%
rename from LICENCE.ibt_firmware
rename to LICENSE.ibt_firmware
diff --git a/LICENCE.it913x b/LICENSE.it913x
similarity index 100%
rename from LICENCE.it913x
rename to LICENSE.it913x
diff --git a/LICENCE.iwlwifi_firmware b/LICENSE.iwlwifi_firmware
similarity index 100%
rename from LICENCE.iwlwifi_firmware
rename to LICENSE.iwlwifi_firmware
diff --git a/LICENCE.kaweth b/LICENSE.kaweth
similarity index 100%
rename from LICENCE.kaweth
rename to LICENSE.kaweth
diff --git a/LICENCE.linaro b/LICENSE.linaro
similarity index 100%
rename from LICENCE.linaro
rename to LICENSE.linaro
diff --git a/LICENCE.mediatek b/LICENSE.mediatek
similarity index 100%
rename from LICENCE.mediatek
rename to LICENSE.mediatek
diff --git a/LICENCE.microchip b/LICENSE.microchip
similarity index 100%
rename from LICENCE.microchip
rename to LICENSE.microchip
diff --git a/LICENCE.moxa b/LICENSE.moxa
similarity index 100%
rename from LICENCE.moxa
rename to LICENSE.moxa
diff --git a/LICENCE.myri10ge_firmware b/LICENSE.myri10ge_firmware
similarity index 100%
rename from LICENCE.myri10ge_firmware
rename to LICENSE.myri10ge_firmware
diff --git a/LICENCE.nvidia b/LICENSE.nvidia
similarity index 100%
rename from LICENCE.nvidia
rename to LICENSE.nvidia
diff --git a/LICENCE.open-ath9k-htc-firmware b/LICENSE.open-ath9k-htc-firmware
similarity index 100%
rename from LICENCE.open-ath9k-htc-firmware
rename to LICENSE.open-ath9k-htc-firmware
diff --git a/LICENCE.phanfw b/LICENSE.phanfw
similarity index 100%
rename from LICENCE.phanfw
rename to LICENSE.phanfw
diff --git a/LICENCE.qat_firmware b/LICENSE.qat_firmware
similarity index 100%
rename from LICENCE.qat_firmware
rename to LICENSE.qat_firmware
diff --git a/LICENCE.qla1280 b/LICENSE.qla1280
similarity index 100%
rename from LICENCE.qla1280
rename to LICENSE.qla1280
diff --git a/LICENCE.qla2xxx b/LICENSE.qla2xxx
similarity index 100%
rename from LICENCE.qla2xxx
rename to LICENSE.qla2xxx
diff --git a/LICENCE.r8a779x_usb3 b/LICENSE.r8a779x_usb3
similarity index 100%
rename from LICENCE.r8a779x_usb3
rename to LICENSE.r8a779x_usb3
diff --git a/LICENCE.ralink-firmware.txt b/LICENSE.ralink-firmware.txt
similarity index 100%
rename from LICENCE.ralink-firmware.txt
rename to LICENSE.ralink-firmware.txt
diff --git a/LICENCE.ralink_a_mediatek_company_firmware b/LICENSE.ralink_a_mediatek_company_firmware
similarity index 100%
rename from LICENCE.ralink_a_mediatek_company_firmware
rename to LICENSE.ralink_a_mediatek_company_firmware
diff --git a/LICENCE.rockchip b/LICENSE.rockchip
similarity index 100%
rename from LICENCE.rockchip
rename to LICENSE.rockchip
diff --git a/LICENCE.rtlwifi_firmware.txt b/LICENSE.rtlwifi_firmware.txt
similarity index 100%
rename from LICENCE.rtlwifi_firmware.txt
rename to LICENSE.rtlwifi_firmware.txt
diff --git a/LICENCE.siano b/LICENSE.siano
similarity index 100%
rename from LICENCE.siano
rename to LICENSE.siano
diff --git a/LICENCE.ti-connectivity b/LICENSE.ti-connectivity
similarity index 100%
rename from LICENCE.ti-connectivity
rename to LICENSE.ti-connectivity
diff --git a/LICENCE.ti-keystone b/LICENSE.ti-keystone
similarity index 100%
rename from LICENCE.ti-keystone
rename to LICENSE.ti-keystone
diff --git a/LICENCE.ti-tspa b/LICENSE.ti-tspa
similarity index 100%
rename from LICENCE.ti-tspa
rename to LICENSE.ti-tspa
diff --git a/LICENCE.ueagle-atm4-firmware b/LICENSE.ueagle-atm4-firmware
similarity index 100%
rename from LICENCE.ueagle-atm4-firmware
rename to LICENSE.ueagle-atm4-firmware
diff --git a/LICENCE.via_vt6656 b/LICENSE.via_vt6656
similarity index 100%
rename from LICENCE.via_vt6656
rename to LICENSE.via_vt6656
diff --git a/LICENCE.wl1251 b/LICENSE.wl1251
similarity index 100%
rename from LICENCE.wl1251
rename to LICENSE.wl1251
diff --git a/LICENCE.xc4000 b/LICENSE.xc4000
similarity index 100%
rename from LICENCE.xc4000
rename to LICENSE.xc4000
diff --git a/LICENCE.xc5000 b/LICENSE.xc5000
similarity index 100%
rename from LICENCE.xc5000
rename to LICENSE.xc5000
diff --git a/LICENCE.xc5000c b/LICENSE.xc5000c
similarity index 100%
rename from LICENCE.xc5000c
rename to LICENSE.xc5000c
diff --git a/WHENCE b/WHENCE
index c0c6e4da..f2417194 100644
--- a/WHENCE
+++ b/WHENCE
@@ -13,7 +13,7 @@ Driver: BCM-0bb4-0306 Cypress Bluetooth firmware for HTC Vive
 File: brcm/BCM-0bb4-0306.hcd
 Link: brcm/BCM-0a5c-6410.hcd -> BCM-0bb4-0306.hcd
 
-Licence: Redistributable. See LICENCE.cypress for details.
+License: Redistributable. See LICENSE.cypress for details.
 
 --------------------------------------------------------------------------
 
@@ -21,7 +21,7 @@ Driver: snd-korg1212 -- Korg 1212 IO audio device
 
 File: korg/k1212.dsp
 
-Licence: Unknown
+License: Unknown
 
 Found in alsa-firmware package in hex form; no licensing information.
 
@@ -32,7 +32,7 @@ Driver: snd-maestro3 -- ESS Allegro Maestro3 audio device
 File: ess/maestro3_assp_kernel.fw
 File: ess/maestro3_assp_minisrc.fw
 
-Licence: Unknown
+License: Unknown
 
 Found in alsa-firmware package in hex form with a comment claiming to
 be GPLv2+, but without source -- and with another comment saying "ESS
@@ -47,7 +47,7 @@ File: yamaha/ds1_ctrl.fw
 File: yamaha/ds1_dsp.fw
 File: yamaha/ds1e_ctrl.fw
 
-Licence: Unknown
+License: Unknown
 
 Found alsa-firmware package in hex form, with the following comment:
    Copyright (c) 1997-1999 Yamaha Corporation. All Rights Reserved.
@@ -61,7 +61,7 @@ File: advansys/3550.bin
 File: advansys/38C0800.bin
 File: advansys/38C1600.bin
 
-Licence: BSD, no source available.
+License: BSD, no source available.
 
 Found in hex form in kernel source.
 
@@ -73,7 +73,7 @@ File: qlogic/1040.bin
 File: qlogic/1280.bin
 File: qlogic/12160.bin
 
-Licence: Redistributable. See LICENCE.qla1280 for details
+License: Redistributable. See LICENSE.qla1280 for details
 
 --------------------------------------------------------------------------
 
@@ -84,7 +84,7 @@ File: kaweth/new_code_fix.bin
 File: kaweth/trigger_code.bin
 File: kaweth/trigger_code_fix.bin
 
-Licence: Redistributable. See LICENCE.kaweth for details
+License: Redistributable. See LICENSE.kaweth for details
 
 Found in hex form in the kernel source.
 
@@ -94,7 +94,7 @@ Driver: dvb-ttusb-budget -- Technotrend/Hauppauge Nova-USB devices
 
 File: ttusb-budget/dspbootcode.bin
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in the kernel source.
 
@@ -117,7 +117,7 @@ File: keyspan/usa49wlc.fw
 
 Converted from Intel HEX files, used in our binary representation of ihex.
 
-Original licence information:
+Original license information:
 
 		Copyright (C) 1999-2001
 		Keyspan, A division of InnoSys Incorporated ("Keyspan")
@@ -149,7 +149,7 @@ Source: keyspan_pda/xircom_pgs.S
 
 Source: keyspan_pda/Makefile
 
-Licence: GPLv2 or later. See GPL-2 and GPL-3 for details.
+License: GPLv2 or later. See GPL-2 and GPL-3 for details.
 
 Compiled from original 8051 source into Intel HEX, used in our binary ihex form.
 
@@ -169,7 +169,7 @@ File: emi26/loader.fw
 
 Converted from Intel HEX files, used in our binary representation of ihex.
 
-Original licence information:
+Original license information:
 /*
  * This firmware is for the Emagic EMI 2|6 Audio Interface
  *
@@ -211,7 +211,7 @@ Info: DATE=16.10.2002
 
 Converted from Intel HEX files, used in our binary representation of ihex.
 
-Original licence information: None
+Original license information: None
 
 --------------------------------------------------------------------------
 
@@ -223,7 +223,7 @@ Info: firmware 9/10/04 FW3410_Special_StartWdogOnStartPort
 File: ti_5052.fw
 Info: firmware 9/18/04
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
+License: Allegedly GPLv2+, but no source visible. Marked:
 	 Copyright (C) 2004 Texas Instruments
 
 Found in hex form in kernel source.
@@ -236,7 +236,7 @@ File: mts_cdma.fw
 File: mts_gsm.fw
 File: mts_edge.fw
 
-Licence: "all firmware components are redistributable in binary form"
+License: "all firmware components are redistributable in binary form"
          per support@multitech.com
 	 Copyright (C) 2005 Multi-Tech Systems, Inc.
 
@@ -249,7 +249,7 @@ Driver: ti_usb_3410_5052 -- Multi-Tech USB fax modems
 File: mts_mt9234mu.fw
 File: mts_mt9234zba.fw
 
-Licence: Unknown
+License: Unknown
 
 --------------------------------------------------------------------------
 
@@ -260,10 +260,10 @@ Version: 4.06
 
 File: whiteheat_loader.fw
 
-Licence: Allegedly GPLv2, but no source visible. Marked:
+License: Allegedly GPLv2, but no source visible. Marked:
 	 Copyright (C) 2000-2002  ConnectTech Inc
 
-Debug loader claims the following behaviour:
+Debug loader claims the following behavior:
 	Port 1 LED flashes when the vend_ax program is running
 	Port 2 LED flashes when any SETUP command arrives
 	Port 3 LED flashes when any valid VENDOR request occurs
@@ -277,7 +277,7 @@ Driver: cpia2 -- cameras based on Vision's CPiA2
 
 File: cpia2/stv0672_vp4.bin
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
+License: Allegedly GPLv2+, but no source visible. Marked:
 	Copyright (C) 2001 STMicroelectronics, Inc.
 	Contact:  steve.miller@st.com
 	Description: This file contains patch data for the CPiA2 (stv0672) VP4.
@@ -291,7 +291,7 @@ Driver: dabusb -- Digital Audio Broadcasting (DAB) Receiver for USB and Linux
 File: dabusb/firmware.fw
 File: dabusb/bitstream.bin
 
-Licence: Distributable
+License: Distributable
 
  * Copyright (C) 1999 BayCom GmbH
  *
@@ -306,7 +306,7 @@ Driver: vicam -- USB 3com HomeConnect (aka vicam)
 
 File: vicam/firmware.fw
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in kernel source.
 
@@ -319,7 +319,7 @@ File: edgeport/boot2.fw
 File: edgeport/down.fw
 File: edgeport/down2.fw
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
+License: Allegedly GPLv2+, but no source visible. Marked:
 //**************************************************************
 //* Edgeport/4 Binary Image
 //* Generated by HEX2C v1.06
@@ -335,7 +335,7 @@ Driver: io_ti - USB Inside Out Edgeport Serial Driver
 
 File: edgeport/down3.bin
 
-Licence:
+License:
 //**************************************************************
 //* Edgeport Binary Image (for TI based products)
 //* Generated by TIBin2C v2.00 (watchport)
@@ -353,7 +353,7 @@ Source: dsp56k/bootstrap.asm
 Source: dsp56k/Makefile
 Source: dsp56k/concat-bootstrap.pl
 
-Licence: GPLv2 or later. See GPL-2 and GPL-3 for details.
+License: GPLv2 or later. See GPL-2 and GPL-3 for details.
 
 DSP56001 assembler, buildable with a56 from
 http://www.zdomain.com/a56.html
@@ -368,7 +368,7 @@ File: sb16/ima_adpcm_init.csp
 File: sb16/ima_adpcm_playback.csp
 File: sb16/ima_adpcm_capture.csp
 
-Licence: Allegedly GPLv2+, but no source visible. Marked:
+License: Allegedly GPLv2+, but no source visible. Marked:
 /*
  *  Copyright (c) 1994 Creative Technology Ltd.
  *  Microcode files for SB16 Advanced Signal Processor
@@ -393,7 +393,7 @@ Version: 8.07.00 MID
 File: ql2500_fw.bin
 Version: 8.07.00 MIDQ
 
-Licence: Redistributable. See LICENCE.qla2xxx for details
+License: Redistributable. See LICENSE.qla2xxx for details
 
 Available from http://ldriver.qlogic.com/firmware/
 
@@ -406,7 +406,7 @@ Version: 9.48 Hermes I
 File: agere_ap_fw.bin
 Version: 9.48 Hermes I
 
-Licence: Redistributable. See LICENCE.agere for details
+License: Redistributable. See LICENSE.agere for details
 
 --------------------------------------------------------------------------
 
@@ -415,7 +415,7 @@ Driver: ar9170 - Atheros 802.11n "otus" USB
 File: ar9170-1.fw
 File: ar9170-2.fw
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -429,14 +429,14 @@ Version: 1.3.1
 File: htc_7010.fw
 Version: 1.3.1
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 File: ath9k_htc/htc_7010-1.4.0.fw
 Version: 1.4.0
 File: ath9k_htc/htc_9271-1.4.0.fw
 Version: 1.4.0
 
-Licence: Free software. See LICENCE.open-ath9k-htc-firmware for details
+License: Free software. See LICENSE.open-ath9k-htc-firmware for details
 
 --------------------------------------------------------------------------
 
@@ -444,7 +444,7 @@ Driver: cassini - Sun Cassini
 
 File: sun/cassini.bin
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in kernel source.
 
@@ -458,7 +458,7 @@ File: slicoss/oasisdbgdownload.sys
 File: slicoss/oasisdownload.sys
 File: slicoss/oasisrcvucode.sys
 
-Licence:
+License:
 		Copyright (C) 1999-2009 Alacritech, Inc.
 
 	as an unpublished work. This notice does not imply unrestricted or
@@ -482,7 +482,7 @@ Driver: sxg - Alacritech IS-NIC products
 File: sxg/saharadownloadB.sys
 File: sxg/saharadbgdownloadB.sys
 
-Licence:
+License:
 		Copyright (C) 1999-2009 Alacritech, Inc.
 
 	as an unpublished work. This notice does not imply unrestricted or
@@ -511,7 +511,7 @@ File: cxgb3/t3fw-7.4.0.bin
 File: cxgb3/t3fw-7.10.0.bin
 File: cxgb3/t3fw-7.12.0.bin
 
-Licence: GPLv2 or OpenIB.org BSD license, no source visible
+License: GPLv2 or OpenIB.org BSD license, no source visible
 
 --------------------------------------------------------------------------
 
@@ -521,7 +521,7 @@ File: cxgb3/ael2005_opt_edc.bin
 File: cxgb3/ael2005_twx_edc.bin
 File: cxgb3/ael2020_twx_edc.bin
 
-Licence:
+License:
  *	Copyright (c) 2007-2009 NetLogic Microsystems, Inc.
  *
  *	Permission is hereby granted for the distribution of this firmware
@@ -555,7 +555,7 @@ Link: cxgb4/t4-config.txt -> configs/t4-config-default.txt
 Link: cxgb4/t5-config.txt -> configs/t5-config-default.txt
 Link: cxgb4/t6-config.txt -> configs/t6-config-default.txt
 
-Licence: Redistributable. See LICENCE.chelsio_firmware for details
+License: Redistributable. See LICENSE.chelsio_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -565,7 +565,7 @@ File: e100/d101m_ucode.bin
 File: e100/d101s_ucode.bin
 File: e100/d102e_ucode.bin
 
-Licence: Redistributable. See LICENCE.e100 for details
+License: Redistributable. See LICENSE.e100 for details
 
 --------------------------------------------------------------------------
 
@@ -574,7 +574,7 @@ Driver: acenic -- Alteon AceNIC Gigabit Ethernet card
 File: acenic/tg1.bin
 File: acenic/tg2.bin
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in kernel source, but source allegedly available at
 http://alteon.shareable.org/
@@ -588,7 +588,7 @@ File: tigon/tg3_tso.bin
 File: tigon/tg3_tso5.bin
 File: tigon/tg357766.bin
 
-Licence:
+License:
  * Firmware is:
  *	Derived from proprietary unpublished source code,
  *	Copyright (C) 2000-2013 Broadcom Corporation.
@@ -606,13 +606,13 @@ Driver: starfire - Adaptec Starfire/DuraLAN support
 File: adaptec/starfire_rx.bin
 File: adaptec/starfire_tx.bin
 
-Licence: Allegedly GPLv2, but no source visible.
+License: Allegedly GPLv2, but no source visible.
 
 Found in hex form in kernel source, with the following notice:
 
  BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE IT IS LICENSED "AS IS" AND
  THERE IS NO WARRANTY FOR THE PROGRAM, INCLUDING BUT NOT LIMITED TO THE
- IMPLIED WARRANTIES OF MERCHANTIBILITY OR FITNESS FOR A PARTICULAR PURPOSE
+ IMPLIED WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE
  (TO THE EXTENT PERMITTED BY APPLICABLE LAW). USE OF THE PROGRAM IS AT YOUR
  OWN RISK. IN NO EVENT WILL ADAPTEC OR ITS LICENSORS BE LIABLE TO YOU FOR
  DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
@@ -648,7 +648,7 @@ Link: libertas/sd8688.bin -> ../mrvl/sd8688.bin
 File: mrvl/sd8688_helper.bin
 Link: libertas/sd8688_helper.bin -> ../mrvl/sd8688_helper.bin
 
-Licence: Redistributable. See LICENCE.Marvell for details.  Extracted from
+License: Redistributable. See LICENSE.Marvell for details.  Extracted from
 Linux driver tarballs downloaded from Marvell's "Extranet" with permission.
 
 --------------------------------------------------------------------------
@@ -664,7 +664,7 @@ Version: 5.132.3.p1
 File: libertas/usb8388_olpc.bin
 Version: 5.110.22.p23
 
-Licence: Redistributable. See LICENCE.OLPC for details.
+License: Redistributable. See LICENSE.OLPC for details.
 
 Available from http://dev.laptop.org/pub/firmware/libertas/
 
@@ -684,7 +684,7 @@ File: mwl8k/helper_8366.fw
 File: mwl8k/fmimage_8764_ap-1.fw
 Version: 7.4.0.9
 
-Licence: Redistributable. See LICENCE.Marvell for details.  8687 images
+License: Redistributable. See LICENSE.Marvell for details.  8687 images
 downloaded from Marvell's "Extranet" with permission.  8366 images contributed
 directly by Marvell.
 
@@ -740,7 +740,7 @@ Version: W16.68.1.p179
 File: mrvl/sdsd8977_combo_v2.bin
 Version: W16.68.1.p195
 
-Licence: Redistributable. See LICENCE.NXP for details.
+License: Redistributable. See LICENSE.NXP for details.
 Originates from https://github.com/NXP/mwifiex-firmware.git
 
 --------------------------------------------------------------------------
@@ -1096,7 +1096,7 @@ Version: 74.f92b5fed.0
 
 File: iwlwifi-ty-a0-gf-a0.pnvm
 
-Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
+License: Redistributable. See LICENSE.iwlwifi_firmware for details
 
 Also available from http://wireless.kernel.org/en/users/Drivers/iwlwifi#Firmware
 
@@ -1109,7 +1109,7 @@ Version: irci_irci_ecr-master_20161208_0213_20170112_1500
 md5sum: 59abc311fce49c5a180b5a8a3917912d
 Link: intel/ipu3-fw.bin -> irci_irci_ecr-master_20161208_0213_20170112_1500.bin
 
-Licence: Redistributable. See LICENSE.ipu3_firmware for details
+License: Redistributable. See LICENSE.ipu3_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -1117,7 +1117,7 @@ Driver: tehuti - Tehuti Networks 10G Ethernet
 
 File: tehuti/bdx.bin
 
-Licence:
+License:
 
  Copyright (C) 2007 Tehuti Networks Ltd.
 
@@ -1133,7 +1133,7 @@ Driver: typhoon - 3cr990 series Typhoon
 
 File: 3com/typhoon.bin
 
-Licence:
+License:
 /*
  * Copyright 1999-2004 3Com Corporation.  All Rights Reserved.
  *
@@ -1176,7 +1176,7 @@ Driver: yam - YAM driver for AX.25
 File: yam/1200.bin
 File: yam/9600.bin
 
-Licence:
+License:
  * (C) F6FBB 1998
 
 Found in hex form in kernel source.
@@ -1194,7 +1194,7 @@ File: cis/PE-200.cis
 File: cis/PE520.cis
 Source: cis/
 
-Licence: Dual GPLv2/MPL
+License: Dual GPLv2/MPL
 
 Originally developed by the pcmcia-cs project
 Copyright (C) 1998, 1999, 2000 David A. Hinds
@@ -1206,7 +1206,7 @@ Driver: 3c589_cs - 3Com PCMCIA adapter
 File: cis/3CXEM556.cis
 Source: cis/src/3CXEM556.cis
 
-Licence: Dual GPLv2/MPL
+License: Dual GPLv2/MPL
 
 Originally developed by the pcmcia-cs project
 Copyright (C) 1998, 1999, 2000 David A. Hinds
@@ -1218,7 +1218,7 @@ Driver: 3c574_cs - 3Com PCMCIA adapter
 File: cis/3CCFEM556.cis
 Source: cis/src/3CCFEM556.cis
 
-Licence: Dual GPLv2/MPL
+License: Dual GPLv2/MPL
 
 Originally developed by the pcmcia-cs project
 Copyright (C) 1998, 1999, 2000 David A. Hinds
@@ -1236,7 +1236,7 @@ Source: cis/src/RS-COM-2P.cis
 Source: cis/src/COMpad2.cis
 Source: cis/src/COMpad4.cis
 
-Licence: Dual GPLv2/MPL
+License: Dual GPLv2/MPL
 
 Originally developed by the pcmcia-cs project
 Copyright (C) 1998, 1999, 2000 David A. Hinds
@@ -1249,7 +1249,7 @@ File: cis/SW_555_SER.cis
 File: cis/SW_7xx_SER.cis
 File: cis/SW_8xx_SER.cis
 
-Licence: GPLv3. See GPL-3 for details.
+License: GPLv3. See GPL-3 for details.
 
 Copyright Sierra Wireless
 
@@ -1259,7 +1259,7 @@ Driver: smc91c92_cs - SMC 91Cxx PCMCIA
 
 File: ositech/Xilinx7OD.bin
 
-Licence: Allegedly GPL, but no source visible. Marked:
+License: Allegedly GPL, but no source visible. Marked:
     This file contains the firmware of Seven of Diamonds from OSITECH.
     (Special thanks to Kevin MacPherson of OSITECH)
 
@@ -1267,28 +1267,28 @@ Found in hex form in kernel source.
 
 --------------------------------------------------------------------------
 
-Driver: cx231xx - Conexant Cx23100/101/102 USB broadcast A/V decoder
+Driver: cx231xx - Connexant Cx23100/101/102 USB broadcast A/V decoder
 
 File: v4l-cx231xx-avcore-01.fw
 
-Driver: cx23418 - Conexant PCI Broadcast A/V with MPEG encoder
+Driver: cx23418 - Connexant PCI Broadcast A/V with MPEG encoder
 
 File: v4l-cx23418-apu.fw
 File: v4l-cx23418-cpu.fw
 File: v4l-cx23418-dig.fw
 
-Driver: cx23885 - Conexant PCI Express Broadcast A/V decoder
+Driver: cx23885 - Connexant PCI Express Broadcast A/V decoder
 
 File: v4l-cx23885-avcore-01.fw
 
-Driver: cx23840 - Conexant sideport Broadcast A/V decoder
+Driver: cx23840 - Connexant sideport Broadcast A/V decoder
 
 File: v4l-cx25840.fw
 
-Licence: Redistributable.
+License: Redistributable.
 
-  Conexant grants permission to use and redistribute these firmware
-  files for use with Conexant devices, but not as a part of the Linux
+  Connexant grants permission to use and redistribute these firmware
+  files for use with Connexant devices, but not as a part of the Linux
   kernel or in any other form which would require these files themselves
   to be covered by the terms of the GNU General Public License.
   These firmware files are distributed in the hope that they will be
@@ -1301,7 +1301,7 @@ Driver: qlogicpti - PTI Qlogic, ISP Driver
 
 File: qlogic/isp1000.bin
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in kernel source.
 
@@ -1311,7 +1311,7 @@ Driver: myri_sbus - MyriCOM Gigabit Ethernet
 
 File: myricom/lanai.bin
 
-Licence: Unknown
+License: Unknown
 
 Found in hex form in kernel source.
 
@@ -1356,7 +1356,7 @@ File: bnx2/bnx2-rv2p-06-6.0.15.fw
 File: bnx2/bnx2-rv2p-09-6.0.17.fw
 File: bnx2/bnx2-rv2p-09ax-6.0.17.fw
 
-Licence:
+License:
 
  This file contains firmware data derived from proprietary unpublished
  source code, Copyright (c) 2004 - 2010 Broadcom Corporation.
@@ -1374,7 +1374,7 @@ Driver: netxen_nic - NetXen Multi port (1/10) Gigabit Ethernet NIC
 File: phanfw.bin
 Version: 4.0.590
 
-Licence: Redistributable. See LICENCE.phanfw for details.
+License: Redistributable. See LICENSE.phanfw for details.
 
 Available from http://ldriver.qlogic.com/firmware/netxen_nic/new/
 
@@ -1386,7 +1386,7 @@ File: av7110/bootcode.bin
 Source: av7110/Boot.S
 Source: av7110/Makefile
 
-Licence: GPLv2 or later. See GPL-2 and GPL-3 for details.
+License: GPLv2 or later. See GPL-2 and GPL-3 for details.
 
 ARM assembly source code from https://linuxtv.org/downloads/firmware/Boot.S
 
@@ -1396,7 +1396,7 @@ Driver: snd-wavefront - ISA WaveFront sound card
 
 File: yamaha/yss225_registers.bin
 
-Licence: Allegedly GPLv2+, but no source visible.
+License: Allegedly GPLv2+, but no source visible.
 
 Found in hex form in kernel source, with the following comment:
    Copyright (c) 1998-2002 by Paul Davis <pbd@op.net>
@@ -1409,7 +1409,7 @@ File: rt2561.bin
 File: rt2561s.bin
 File: rt2661.bin
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
 
@@ -1419,7 +1419,7 @@ Driver: rt73usb - Ralink RT2571W, RT2671 wireless MACs
 
 File: rt73.bin
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
 
@@ -1431,7 +1431,7 @@ File: mediatek/mt7601u.bin
 Version: 34
 Link: mt7601u.bin -> mediatek/mt7601u.bin
 
-Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+License: Redistributable. See LICENSE.ralink_a_mediatek_company_firmware for details
 
 Downloaded from http://www.mediatek.com/en/downloads/
 
@@ -1445,7 +1445,7 @@ Version: 40
 File: rt3290.bin
 Version: 37
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 Binary file supplied originally by Shiang Tu <shiang_tu@ralinktech.com>, latest
 from http://www.mediatek.com/en/downloads1/downloads/
@@ -1456,7 +1456,7 @@ Driver: rt2860sta - Ralink RT3090 wireless MACs
 
 Link: rt3090.bin -> rt2860.bin
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 --------------------------------------------------------------------------
 
@@ -1465,7 +1465,7 @@ Driver: rt2800usb - Ralink RT2870, RT3070, RT3071, RT3072, RT5370 wireless MACs
 File: rt2870.bin
 Version: 36
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 Binary file supplied originally by Shiang Tu <shiang_tu@ralinktech.com>, latest
 from http://www.mediatek.com/en/downloads1/downloads/
@@ -1477,7 +1477,7 @@ Driver: rt2870sta - Ralink RT2870, RT3070, RT3071 wireless MACs
 Link: rt3070.bin -> rt2870.bin
 File: rt3071.bin
 
-Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
+License: Redistributable. See LICENSE.ralink-firmware.txt for details
 
 rt3071.bin is a copy of bytes 4096-8191 of rt2870.bin for compatibility.
 
@@ -1490,7 +1490,7 @@ File: usbduxfast_firmware.bin
 File: usbduxsigma_firmware.bin
 Source: usbdux/
 
-Licence: GPLv2. See GPL-2 for details.
+License: GPLv2. See GPL-2 for details.
 
 Provided from the author, Bernd Porr <BerndPorr@f2s.com>
 
@@ -1501,7 +1501,7 @@ Driver: xc4000 - Xceive 4000 Tuner driver
 File: dvb-fe-xc4000-1.4.1.fw
 Version: 1.4.1
 
-Licence: Redistributable. See LICENCE.xc4000 for details
+License: Redistributable. See LICENSE.xc4000 for details
 
 --------------------------------------------------------------------------
 Driver: xc5000 - Xceive 5000 Tuner driver
@@ -1512,7 +1512,7 @@ Version: 1.6.114
 File: dvb-fe-xc5000c-4.1.30.7.fw
 Version: 4.1.30.7
 
-Licence: Redistributable. See LICENCE.xc5000 and LICENCE.xc5000c for details
+License: Redistributable. See LICENSE.xc5000 and LICENSE.xc5000c for details
 
 --------------------------------------------------------------------------
 
@@ -1521,7 +1521,7 @@ Driver: dib0700 - DiBcom dib0700 USB DVB bridge driver
 File: dvb-usb-dib0700-1.20.fw
 Version: 1.20
 
-Licence: Redistributable. See LICENSE.dib0700 for details
+License: Redistributable. See LICENSE.dib0700 for details
 
 --------------------------------------------------------------------------
 
@@ -1532,7 +1532,7 @@ Version: 1.0
 
 Fix EEPROM radio table issue and change PID to 3005
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -1541,7 +1541,7 @@ Driver: mga - Matrox G200/G400/G550
 File: matrox/g200_warp.fw
 File: matrox/g400_warp.fw
 
-Licence:
+License:
 
 Copyright 1999 Matrox Graphics Inc.
 All Rights Reserved.
@@ -1572,7 +1572,7 @@ Driver: r128 - ATI Rage 128
 
 File: r128/r128_cce.bin
 
-Licence:
+License:
 
 Copyright 2000 Advanced Micro Devices, Inc.
 
@@ -1629,7 +1629,7 @@ File: radeon/RV730_me.bin
 File: radeon/RV710_pfp.bin
 File: radeon/RV710_me.bin
 
-Licence:
+License:
 
  * Copyright 2007-2009 Advanced Micro Devices, Inc.
  * All Rights Reserved.
@@ -1880,7 +1880,7 @@ File: radeon/mullins_vce.bin
 File: radeon/banks_k_2_smc.bin
 File: radeon/si58_mc.bin
 
-Licence: Redistributable. See LICENSE.radeon for details.
+License: Redistributable. See LICENSE.radeon for details.
 
 --------------------------------------------------------------------------
 
@@ -2441,7 +2441,7 @@ File: amdgpu/vcn_4_0_0.bin
 File: amdgpu/vcn_4_0_2.bin
 File: amdgpu/vcn_4_0_4.bin
 
-Licence: Redistributable. See LICENSE.amdgpu for details.
+License: Redistributable. See LICENSE.amdgpu for details.
 
 --------------------------------------------------------------------------
 
@@ -2450,7 +2450,7 @@ Driver: s2255drv
 File: f2255usb.bin
 Version: 1.2.8
 
-Licence: Redistributable.
+License: Redistributable.
 
   Sensoray grants permission to use and redistribute these firmware
   files for use with Sensoray devices, but not as a part of the Linux
@@ -2468,7 +2468,7 @@ File: RTL8192E/boot.img
 File: RTL8192E/data.img
 File: RTL8192E/main.img
 
-Licence: Redistributable, provided by Realtek in their driver
+License: Redistributable, provided by Realtek in their driver
          source download.
 
 --------------------------------------------------------------------------
@@ -2477,7 +2477,7 @@ Driver: lgs8gxx - Legend Silicon GB20600 demodulator driver
 
 File: lgs8g75.fw
 
-Licence: Unknown
+License: Unknown
 
 --------------------------------------------------------------------------
 
@@ -2485,7 +2485,7 @@ Driver: ib_qib - QLogic Infiniband
 
 File: qlogic/sd7220.fw
 
-Licence:
+License:
 
  * Copyright (c) 2007, 2008 QLogic Corporation. All rights reserved.
  *
@@ -2544,7 +2544,7 @@ File: qed/qed_init_values-8.40.33.0.bin
 File: qed/qed_init_values_zipped-8.42.2.0.bin
 File: qed/qed_init_values_zipped-8.59.1.0.bin
 
-Licence:
+License:
   This file contains firmware data derived from proprietary unpublished
   source code.
   Copyright (c) 2015-2018 QLogic Corporation.
@@ -2562,7 +2562,7 @@ File: ueagle-atm/DSP4p.bin
 File: ueagle-atm/eagleIV.fw
 Version: 1.0
 
-Licence: Redistributable. See LICENCE.ueagle-atm4-firmware for details
+License: Redistributable. See LICENSE.ueagle-atm4-firmware for details
 
 --------------------------------------------------------------------------
 
@@ -2591,7 +2591,7 @@ File: ueagle-atm/DSP9i.bin
 File: ueagle-atm/eagleII.fw
 Version: 1.1
 
-Licence: Redistributable. Based on
+License: Redistributable. Based on
          https://mail.gna.org/public/eagleusb-dev/2004-11/msg00172.html
 
 --------------------------------------------------------------------------
@@ -2602,7 +2602,7 @@ File: vxge/X3fw.ncf
 File: vxge/X3fw-pxe.ncf
 Version: 1.8.1
 
-Licence:
+License:
 
  This file contains firmware data derived from proprietary unpublished
  source code, Copyright (c) 2010 Exar Corporation.
@@ -2619,7 +2619,7 @@ File: brcm/bcm43xx-0.fw
 File: brcm/bcm43xx_hdr-0.fw
 Version: 610.812
 
-Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
+License: Redistributable. See LICENSE.broadcom_bcm43xx for details.
 
 --------------------------------------------------------------------------
 
@@ -2648,7 +2648,7 @@ File: brcm/brcmfmac4366b-pcie.bin
 File: brcm/brcmfmac4366c-pcie.bin
 File: brcm/brcmfmac4371-pcie.bin
 
-Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
+License: Redistributable. See LICENSE.broadcom_bcm43xx for details.
 
 File: brcm/brcmfmac4373.bin
 File: cypress/cyfmac43012-sdio.bin
@@ -2694,7 +2694,7 @@ Link: brcm/brcmfmac54591-pcie.bin -> ../cypress/cyfmac54591-pcie.bin
 File: cypress/cyfmac54591-pcie.clm_blob
 Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
 
-Licence: Redistributable. See LICENCE.cypress for details.
+License: Redistributable. See LICENSE.cypress for details.
 
 File: "brcm/brcmfmac43241b4-sdio.Advantech-MICA-071.txt"
 File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
@@ -2753,7 +2753,7 @@ Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt -> brcmfmac43455-sdio.
 Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 
-Licence: GPLv2. See GPL-2 for details.
+License: GPLv2. See GPL-2 for details.
 
 --------------------------------------------------------------------------
 
@@ -2761,7 +2761,7 @@ Driver: ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
 
 File: ti/vpdma-1b8.bin
 
-Licence: Redistributable. See LICENCE.ti-tspa for details.
+License: Redistributable. See LICENSE.ti-tspa for details.
 
 --------------------------------------------------------------------------
 
@@ -2772,7 +2772,7 @@ Version: 4.0.4.3.7
 
 File: ti-connectivity/wl1251-nvs.bin
 
-Licence: Redistributable. See LICENCE.wl1251 for details.
+License: Redistributable. See LICENSE.wl1251 for details.
 
 The published NVS files are for testing only.  Every device needs to
 have a unique NVS which is properly calibrated for best results.
@@ -2834,14 +2834,14 @@ File: ti-connectivity/wl128x-nvs.bin
 Link: ti-connectivity/wl12xx-nvs.bin -> wl127x-nvs.bin
 Link: ti-connectivity/wl1271-nvs.bin -> wl127x-nvs.bin
 
-Licence: Redistributable. See LICENCE.ti-connectivity for details.
+License: Redistributable. See LICENSE.ti-connectivity for details.
 
 The NVS file includes two parts:
 	 - radio calibration
 	 - HW configuration parameters (aka. INI values)
 
 The published NVS files are for testing only.  Every device needs to
-hava a unique NVS which is properly calibrated for best results.  You
+have a a unique NVS which is properly calibrated for best results.  You
 can find more information about NVS generation for your device here:
 
 http://wireless.kernel.org/en/users/Drivers/wl12xx/calibrator
@@ -2868,7 +2868,7 @@ Version: 8.8.0.0.13
 File: ti-connectivity/wl18xx-fw-4.bin
 Version: 8.9.0.0.79
 
-Licence: Redistributable. See LICENCE.ti-connectivity for details.
+License: Redistributable. See LICENSE.ti-connectivity for details.
 
 The driver expects to find the firmwares under a ti-connectivity
 subdirectory.  So if your system looks for firmwares in /lib/firmware,
@@ -2885,7 +2885,7 @@ File: ti-connectivity/TIInit_6.6.15.bts
 Version: 2.14 (TI_P6_15.93)
 File: ti-connectivity/TIInit_7.2.31.bts
 
-Licence: Redistributable. See LICENCE.ti-connectivity for details.
+License: Redistributable. See LICENSE.ti-connectivity for details.
 
 	TIInit_7.2.31.bts version 7.2.31
 
@@ -2897,7 +2897,7 @@ Driver: tlg2300 - Telgent 2300 V4L/DVB driver.
 
 File: tlg2300_firmware.bin
 
-Licence: Redistributable.
+License: Redistributable.
 
   Telegent System grants permission to use and redistribute these
   firmware files for use with devices containing the chip tlg2300, but
@@ -2916,7 +2916,7 @@ File: rtlwifi/rtl8712u.bin
 Info: From Vendor's rtl8712_8188_8191_8192SU_usb_linux_v7_0.20100831
       Reverted rtl8188C_8192C_8192D_usb_linux_v3.4.2_3727.20120404
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2927,7 +2927,7 @@ File: rtlwifi/rtl8192cfwU.bin
 File: rtlwifi/rtl8192cfwU_B.bin
 Info: From Vendor's realtek/rtlwifi_linux_mac80211_0019.0320.2014V628 driver
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2944,7 +2944,7 @@ Info: From Vendor's rtl8188C_8192C_usb_linux_v4.0.1_6911.20130308 driver
         - rtlwifi/rtl8192cufw_B.bin: Rtl8192CUFwUMCBCutImgArray
         - rtlwifi/rtl8192cufw_TMSC.bin: Rtl8192CUFwTSMCImgArray
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2953,7 +2953,7 @@ Driver: rtl8192se - Realtek 802.11n WLAN driver for RTL8192SE
 Info: updated from rtl_92ce_92se_92de_linux_mac80211_0004.0816.2011 driver version
 File: rtlwifi/rtl8192sefw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2962,7 +2962,7 @@ Driver: rtl8192de - Realtek 802.11n WLAN driver for RTL8192DE
 Info: Updated from Realtek version rtl_92ce_92se_92de_8723ae_linux_mac80211_0007.0809.2012
 File: rtlwifi/rtl8192defw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2972,7 +2972,7 @@ Info: Taken from Realtek version rtl_92ce_92se_92de_8723ae_linux_mac80211_0007.0
 File: rtlwifi/rtl8723fw.bin
 File: rtlwifi/rtl8723fw_B.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2983,7 +2983,7 @@ File: rtlwifi/rtl8723befw.bin
 Info: Update to version 36 - Sent by Realtek
 File: rtlwifi/rtl8723befw_36.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -2992,7 +2992,7 @@ Driver: rtl8723de - Realtek 802.11ac WLAN driver for RTL8723DE
 Info: Supplied by Vendor at https://github.com/pkshih/rtlwifi_rtl8723de
 File: rtlwifi/rtl8723defw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3001,7 +3001,7 @@ Driver: rtl8188ee - Realtek 802.11n WLAN driver for RTL8188EE
 Info: Taken from Realtek version rtl_92ce_92se_92de_8723ae_88ee_linux_mac80211_0010.0109.2013
 File: rtlwifi/rtl8188efw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3011,7 +3011,7 @@ Info: From Vendor's realtek/rtlwifi_linux_mac80211_0019.0320.2014V628 driver
 File: rtlwifi/rtl8812aefw.bin
 File: rtlwifi/rtl8812aefw_wowlan.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3023,7 +3023,7 @@ File: rtlwifi/rtl8821aefw_wowlan.bin
 Info: Update to version 29 - Sent by Realtek
 File: rtlwifi/rtl8821aefw_29.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3032,7 +3032,7 @@ Driver: rtl8822be - Realtek 802.11n WLAN driver for RTL8822BE
 Info: Sent to Larry Finger by Realtek engineer Ping-Ke Shih <pkshih@realtek.com>
 File: rtlwifi/rtl8822befw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3046,7 +3046,7 @@ File: rtw88/README
 File: rtw88/rtw8723d_fw.bin
 File: rtw88/rtw8821c_fw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
     These firmware should be put under /lib/firmware/rtw88/
     And note that the rtw88 driver is able to support wake-on-wireless LAN
@@ -3066,7 +3066,7 @@ File: rtw89/rtw8852b_fw.bin
 File: rtw89/rtw8852b_fw-1.bin
 File: rtw89/rtw8852c_fw.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3079,7 +3079,7 @@ Info: Initial version taken from Realtek version
       Same firmware rtl8192eu_nic.bin so just link them
 Link: rtlwifi/rtl8192eefw.bin -> rtl8192eu_nic.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3092,7 +3092,7 @@ Link: rtlwifi/rtl8723bs_nic.bin -> rtl8723bu_nic.bin
 Link: rtlwifi/rtl8723bs_ap_wowlan.bin -> rtl8723bu_ap_wowlan.bin
 Link: rtlwifi/rtl8723bs_wowlan.bin -> rtl8723bu_wowlan.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3150,7 +3150,7 @@ Info: rtl8192fu taken from Realtek driver version
 File: rtlwifi/rtl8192fufw.bin
 Version: 6.0
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3219,7 +3219,7 @@ Version: 0.0.2
 File: rtl_nic/rtl8125b-2.fw
 Version: 0.0.2
 
-Licence:
+License:
  * Copyright © 2011-2013, Realtek Semiconductor Corporation
  *
  * Permission is hereby granted for the distribution of this firmware
@@ -3238,7 +3238,7 @@ File: rtl_nic/rtl8153c-1.fw
 File: rtl_nic/rtl8156a-2.fw
 File: rtl_nic/rtl8156b-2.fw
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
@@ -3246,7 +3246,7 @@ Driver: vt6656 - VIA VT6656 USB wireless driver
 
 File: vntwusb.fw
 
-Licence: Redistributable. See LICENCE.via_vt6656 for details.
+License: Redistributable. See LICENSE.via_vt6656 for details.
 
 --------------------------------------------------------------------------
 
@@ -3270,7 +3270,7 @@ File: ar3k/ramps_0x11020100_40.dfu
 File: ar3k/AthrBT_0x31010100.dfu
 File: ar3k/ramps_0x31010100_40.dfu
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3279,7 +3279,7 @@ Driver: DFU Driver for Atheros bluetooth chipset AR3012
 File: ar3k/AthrBT_0x01020201.dfu
 File: ar3k/1020201coex/ramps_0x01020201_26_HighPriority.dfu
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ar3k for details
+License: Redistributable. See LICENSE.QualcommAtheros_ar3k for details
 
 --------------------------------------------------------------------------
 
@@ -3297,7 +3297,7 @@ File: ar3k/30000/ar3kbdaddr.pst
 File: ar3k/30000/PS_ASIC.pst
 File: ar3k/30000/RamPatch.txt
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3333,7 +3333,7 @@ File: ath6k/AR6002/eeprom.bin
 File: ath6k/AR6002/athwlan.bin.z77
 File: ath6k/AR6002/data.patch.hw2_0.bin
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3400,7 +3400,7 @@ Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
 Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
 File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
 --------------------------------------------------------------------------
 
@@ -3499,7 +3499,7 @@ File: ath11k/IPQ5018/hw1.0/q6_fw.mdt
 Version: WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
 File: ath11k/IPQ5018/hw1.0/Notice.txt
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
 --------------------------------------------------------------------------
 
@@ -3515,7 +3515,7 @@ File: myri10ge_rss_eth_big_z8e.dat
 File: myri10ge_rss_ethp_big_z8e.dat
 Version: 1.4.57
 
-License: Redistributable.  See LICENCE.myri10ge_firmware for details.
+License: Redistributable.  See LICENSE.myri10ge_firmware for details.
 
 --------------------------------------------------------------------------
 
@@ -3529,7 +3529,7 @@ File: ath6k/AR6003.1/hw2.1.1/data.patch.bin
 File: ath6k/AR6003.1/hw2.1.1/endpointping.bin
 File: ath6k/AR6003.1/hw2.1.1/otp.bin
 
-License: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3541,7 +3541,7 @@ File: ar3k/30101coex/PS_ASIC_aclHighPri.pst
 File: ar3k/30101coex/PS_ASIC.pst
 File: ar3k/30101coex/RamPatch.txt
 
-License: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3549,7 +3549,7 @@ Driver: drxk - Micronas DRX-K demodulator driver
 
 File: dvb-usb-terratec-h5-drxk.fw
 
-Licence: Redistributable.
+License: Redistributable.
 
 TERRATEC grants permission to use and redistribute these firmware
 files for use with TERRATEC devices, but not as part of the Linux
@@ -3571,7 +3571,7 @@ File: ene-ub6250/ms_init.bin
 File: ene-ub6250/msp_rdwr.bin
 File: ene-ub6250/ms_rdwr.bin
 
-Licence: Redistributable. See LICENCE.ene_firmware for details.
+License: Redistributable. See LICENSE.ene_firmware for details.
 
 --------------------------------------------------------------------------
 
@@ -3580,7 +3580,7 @@ Driver: isci -- Intel C600 SAS controller driver
 File: isci/isci_firmware.bin
 Source: isci/
 
-Licence: GPLv2. See GPL-2 for details.
+License: GPLv2. See GPL-2 for details.
 
 --------------------------------------------------------------------------
 
@@ -3588,7 +3588,7 @@ Driver: ar5523 -- Atheros AR5523 based USB Wifi dongles
 
 File: ar5523.bin
 
-Licence: Redistributable. See LICENCE.atheros_firmware for details
+License: Redistributable. See LICENSE.atheros_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3600,7 +3600,7 @@ File: s5p-mfc-v6-v2.fw
 File: s5p-mfc-v7.fw
 File: s5p-mfc-v8.fw
 
-Licence: Redistributable.
+License: Redistributable.
 
 Samsung grants permission to use and redistribute aforementioned firmware
 files for the use with Exynos series devices, but not as part of the Linux
@@ -3621,7 +3621,7 @@ Source: carl9170fw/
 
 Downloaded from http://linuxwireless.org/en/users/Drivers/carl9170
 
-Licence: GPLv2. Some build scripts use the New BSD (3-clause) licence.. See GPL-2 for details.
+License: GPLv2. Some build scripts use the New BSD (3-clause) license.. See GPL-2 for details.
 
 --------------------------------------------------------------------------
 
@@ -3630,7 +3630,7 @@ Driver: snd-hda-codec-ca0132 - Creative Sound Core3D codec
 File: ctefx.bin
 File: ctspeq.bin
 
-Licence: Redistributable. See LICENCE.ca0132 for details
+License: Redistributable. See LICENSE.ca0132 for details
 
 Found also in alsa-firmware package.
 
@@ -3788,7 +3788,7 @@ Version: BT_SolarF_JnP2_REL67068
 File:intel/ibt-1040-4150.ddc
 Version: BT_SolarF_JnP2_REL67068
 
-Licence: Redistributable. See LICENCE.ibt_firmware for details
+License: Redistributable. See LICENSE.ibt_firmware for details
 
 File: rtl_bt/rtl8192ee_fw.bin
 File: rtl_bt/rtl8192eu_fw.bin
@@ -3827,7 +3827,7 @@ File: rtl_bt/rtl8852cu_config.bin
 File: rtl_bt/rtl8851bu_fw.bin
 File: rtl_bt/rtl8851bu_config.bin
 
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
+License: Redistributable. See LICENSE.rtlwifi_firmware.txt for details.
 
 Found in vendor driver, linux_bt_usb_2.11.20140423_8723be.rar
 From https://github.com/troy-tan/driver_store
@@ -3845,7 +3845,7 @@ Driver: btmtk_usb - Bluetooth USB driver
 File: mediatek/mt7650.bin
 Link: mt7650.bin -> mediatek/mt7650.bin
 
-Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+License: Redistributable. See LICENSE.ralink_a_mediatek_company_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -3853,7 +3853,7 @@ Driver: rp2 -- Comtrol RocketPort 2 serial driver
 
 File: rp2.fw
 
-Licence: Redistributable.
+License: Redistributable.
 
 Copyright (C) 2013 Comtrol Corporation
 
@@ -3875,7 +3875,7 @@ File: go7007/s2250-2.fw
 Link: s2250.fw -> go7007/s2250-2.fw
 Link: s2250_loader.fw -> go7007/s2250-1.fw
 
-Licence:
+License:
   Sensoray grants permission to use and redistribute these firmware
   files for use with Sensoray devices, but not as a part of the Linux
   kernel or in any other form which would require these files themselves
@@ -3891,7 +3891,7 @@ File: go7007/px-m402u.fw
 File: go7007/px-tv402u.fw
 File: go7007/wis-startrek.fw
 
-Licence: Redistributable. See LICENCE.go7007 for details
+License: Redistributable. See LICENSE.go7007 for details
 
 --------------------------------------------------------------------------
 
@@ -3939,7 +3939,7 @@ File: moxa/moxa-1131.fw
 File: moxa/moxa-1150.fw
 File: moxa/moxa-1151.fw
 
-License: Redistributable. See LICENCE.moxa for details
+License: Redistributable. See LICENSE.moxa for details
 
 --------------------------------------------------------------------------
 
@@ -3955,7 +3955,7 @@ File: moxa/moxa-1618.fw
 File: moxa/moxa-1653.fw
 File: moxa/moxa-1658.fw
 
-License: Redistributable. See LICENCE.moxa for details
+License: Redistributable. See LICENSE.moxa for details
 
 --------------------------------------------------------------------------
 
@@ -3963,7 +3963,7 @@ Driver: cw1200 - ST-E CW1100/CW1200 WLAN driver
 
 File: wsm_22.bin
 Version: WSM395
-Licence: Redistributable. See LICENCE.cw1200 for details.
+License: Redistributable. See LICENSE.cw1200 for details.
 
 File: sdd_sagrad_1091_1098.bin
 
@@ -3989,7 +3989,7 @@ File: cbfw-3.2.5.1.bin
 File: ctfw-3.2.5.1.bin
 File: ct2fw-3.2.5.1.bin
 
-Licence:
+License:
 
 This file contains firmware data derived from proprietary unpublished
 source code.
@@ -4021,7 +4021,7 @@ Link: qat_mmp.bin -> qat_895xcc_mmp.bin
 File: qat_4xxx.bin
 File: qat_4xxx_mmp.bin
 
-Licence: Redistributable. See LICENCE.qat_firmware for details
+License: Redistributable. See LICENSE.qat_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -4044,7 +4044,7 @@ Version: 1.0.5b
 File: rsi/rs9116_wlan_bt_classic.rps
 Version: 1.0.5b
 
-Licence:
+License:
  * Firmware is:
  *	Derived from proprietary unpublished source code,
  *	Copyright (C) 2019 Redpine Signals Inc.
@@ -4061,7 +4061,7 @@ File: r8a779x_usb3_v1.dlmem
 File: r8a779x_usb3_v2.dlmem
 File: r8a779x_usb3_v3.dlmem
 
-Licence: Redistributable. See LICENCE.r8a779x_usb3 for details.
+License: Redistributable. See LICENSE.r8a779x_usb3 for details.
 
 --------------------------------------------------------------------------
 
@@ -4069,7 +4069,7 @@ Driver: snd_soc_sst_acpi
 
 File: intel/fw_sst_0f28.bin-48kHz_i2s_master
 
-License: Redistributable. See LICENCE.fw_sst_0f28 for details
+License: Redistributable. See LICENSE.fw_sst_0f28 for details
 
 --------------------------------------------------------------------------
 
@@ -4078,7 +4078,7 @@ Driver: as102 - Abilis Systems Single DVB-T Receiver
 File: as102_data1_st.hex
 File: as102_data2_st.hex
 
-License: Redistributable. See LICENCE.Abilis for details
+License: Redistributable. See LICENSE.Abilis for details
 
 --------------------------------------------------------------------------
 
@@ -4087,7 +4087,7 @@ Driver: it9135 -- ITEtech IT913x DVB-T USB driver
 File: dvb-usb-it9135-01.fw
 File: dvb-usb-it9135-02.fw
 
-Licence: Redistributable. See LICENCE.it913x for details
+License: Redistributable. See LICENSE.it913x for details
 
 --------------------------------------------------------------------------
 
@@ -4097,7 +4097,7 @@ File: intel/catpt/bdw/dsp_basefw.bin
 Version: 44b81c4d5397a63108356f58f036953d9b288c4e
 Link: intel/IntcSST2.bin -> catpt/bdw/dsp_basefw.bin
 
-License: Redistributable. See LICENCE.IntcSST2 for details
+License: Redistributable. See LICENSE.IntcSST2 for details
 
 --------------------------------------------------------------------------
 
@@ -4116,7 +4116,7 @@ File: intel/avs/cnl/dsp_basefw.bin
 Version: 10.23.00.8551
 Link: intel/dsp_fw_cnl.bin -> avs/cnl/dsp_basefw.bin
 
-License: Redistributable. See LICENCE.adsp_sst for details
+License: Redistributable. See LICENSE.adsp_sst for details
 
 --------------------------------------------------------------------------
 
@@ -4125,7 +4125,7 @@ Driver: snd_intel_sst_core
 File: intel/fw_sst_0f28.bin
 File: intel/fw_sst_0f28_ssp0.bin
 
-License: Redistributable. See LICENCE.fw_sst_0f28 for details
+License: Redistributable. See LICENSE.fw_sst_0f28 for details
 
 --------------------------------------------------------------------------
 
@@ -4134,7 +4134,7 @@ Driver: snd_intel_sst_core
 File: intel/fw_sst_22a8.bin
 Version: 01.0B.02.02
 
-License: Redistributable. See LICENCE.fw_sst_0f28 for details
+License: Redistributable. See LICENSE.fw_sst_0f28 for details
 
 --------------------------------------------------------------------------
 
@@ -4145,14 +4145,14 @@ Version: 8.20.00.969
 File: intel/dsp_fw_release_v3402.bin
 Version: 9.21.00.3402_161
 
-License: Redistributable. See LICENCE.adsp_sst for details
+License: Redistributable. See LICENSE.adsp_sst for details
 
 File: intel/dsp_fw_bxtn_v2219.bin
 Version: 9.22.01.2219_64
 File: intel/dsp_fw_bxtn_v3366.bin
 Version: 9.22.01.3366_157
 
-License: Redistributable. See LICENCE.adsp_sst for details
+License: Redistributable. See LICENSE.adsp_sst for details
 
 File: intel/dsp_fw_kbl_v701.bin
 Version: 9.21.00.701
@@ -4169,7 +4169,7 @@ Version: 9.21.00.3420_163
 File: intel/dsp_fw_kbl_v3402.bin
 Version: 9.21.00.3402_161
 
-License: Redistributable. See LICENCE.adsp_sst for details
+License: Redistributable. See LICENSE.adsp_sst for details
 
 File: intel/dsp_fw_glk_v1814.bin
 Version: 9.92.01.1814
@@ -4185,7 +4185,7 @@ Version: 10.00.00.1191
 File: intel/dsp_fw_cnl_v1858.bin
 Version: 10.23.00.1858
 
-License: Redistributable. See LICENCE.adsp_sst for details
+License: Redistributable. See LICENSE.adsp_sst for details
 
 --------------------------------------------------------------------------
 
@@ -4205,7 +4205,7 @@ File: sms1xxx-nova-b-dvbt-01.fw
 File: sms1xxx-stellar-dvbt-01.fw
 File: tdmb_nova_12mhz.inp
 
-Licence: Redistributable. See LICENCE.siano for details
+License: Redistributable. See LICENSE.siano for details
 
 --------------------------------------------------------------------------
 
@@ -4223,7 +4223,7 @@ Version: v55.15
 File: nvidia/tegra194/xusb.bin
 Version: v60.06
 
-Licence: Redistributable. See LICENCE.nvidia for details
+License: Redistributable. See LICENSE.nvidia for details
 
 --------------------------------------------------------------------------
 
@@ -4240,7 +4240,7 @@ Link: nvidia/tegra186/vic.bin -> vic04_ucode.bin
 
 File: nvidia/tegra194/vic.bin
 
-Licence: Redistributable. See LICENCE.nvidia for details
+License: Redistributable. See LICENSE.nvidia for details
 
 --------------------------------------------------------------------------
 
@@ -4254,7 +4254,7 @@ File: atusb/rzusb-0.3.bin
 Version: 0.3
 Info: atusb/ChangeLog
 
-Licence: GPLv2 or later. See GPL-2 and GPL-3 for details.
+License: GPLv2 or later. See GPL-2 and GPL-3 for details.
 
 --------------------------------------------------------------------------
 
@@ -4301,7 +4301,7 @@ File: qca/nvm_usb_00130201_gf_0303.bin
 File: qca/rampatch_usb_00190200.bin
 File: qca/nvm_usb_00190200.bin
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
 
 --------------------------------------------------------------------------
 
@@ -4321,7 +4321,7 @@ File: qca/msnv11.bin
 File: qca/msnv11.b0a
 File: qca/msnv11.b09
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
 
 Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
 
@@ -4334,7 +4334,7 @@ File: qca/hpnv21g.301
 File: qca/hpnv21g.302
 
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt for details
 
 --------------------------------------------------------------------------
 
@@ -4352,7 +4352,7 @@ Version: v1.7.2
 File: liquidio/lio_410nv_nic.bin
 Version: v1.7.2
 
-Licence: Redistributable. See LICENCE.cavium_liquidio for details
+License: Redistributable. See LICENSE.cavium_liquidio for details
 
 --------------------------------------------------------------------------
 
@@ -4364,7 +4364,7 @@ Version: v01
 File: cavium/cnn55xx_se.fw
 Version: v10
 
-Licence: Redistributable. See LICENCE.cavium for details
+License: Redistributable. See LICENSE.cavium for details
 
 --------------------------------------------------------------------------
 
@@ -5147,7 +5147,7 @@ File: nvidia/tu10x/typec/ccg_primary.cyacd
 File: nvidia/tu10x/typec/ccg_secondary.cyacd
 File: nvidia/tu10x/typec/ccg_boot.cyacd
 
-Licence: Redistributable. See LICENCE.nvidia for details
+License: Redistributable. See LICENSE.nvidia for details
 
 --------------------------------------------------------------------------
 
@@ -5175,7 +5175,7 @@ Version: 0x4755
 File: hfi1_sbus.fw
 Version: 0x10130001
 
-Licence: Redistributable. See LICENSE.hfi1_firmware for details
+License: Redistributable. See LICENSE.hfi1_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -5183,7 +5183,7 @@ Driver: knav_qmss_queue - TI Keystone 2 QMSS driver
 
 File: ti-keystone/ks2_qmss_pdsp_acc48_k2_le_1_0_0_9.bin
 
-Licence: Redistributable. See LICENCE.ti-keystone for details.
+License: Redistributable. See LICENSE.ti-keystone for details.
 
 --------------------------------------------------------------------------
 
@@ -5195,7 +5195,7 @@ Version: 7.2.8.6
 File: mwlwifi/88W8897.bin
 Version: 8.2.0.10
 
-Licence: Redistributable. See LICENCE.Marvell for details.
+License: Redistributable. See LICENSE.Marvell for details.
 
 --------------------------------------------------------------------------
 
@@ -5206,7 +5206,7 @@ File: mediatek/mt8173/vpu_p.bin
 Link: vpu_d.bin -> mediatek/mt8173/vpu_d.bin
 Link: vpu_p.bin -> mediatek/mt8173/vpu_p.bin
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5221,7 +5221,7 @@ Version: v2.0.20536
 File: mediatek/mt8195/scp.img
 Version: v2.0.21961
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5235,7 +5235,7 @@ Version: 20180517181834
 # File: mediatek/mt7663pr2h.bin
 # Version: 7663e2ccn04-2006030247
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5244,7 +5244,7 @@ Driver: rk3399-dptx - ROCKCHIP rk3399 dptx firmware
 File: rockchip/dptx.bin
 Version: 3.1
 
-Licence: Redistributable. See LICENCE.rockchip for details.
+License: Redistributable. See LICENSE.rockchip for details.
 
 --------------------------------------------------------------------------
 
@@ -5256,7 +5256,7 @@ Version: 2.6
 File: mediatek/mt7650e.bin
 Version: 1.0.07-b370
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 ---------------------------------------------------------------------------
 
@@ -5270,7 +5270,7 @@ File: mediatek/mt7662_rom_patch.bin
 Version: 0.0.2_P69
 Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
 
-Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
+License: Redistributable. See LICENSE.ralink_a_mediatek_company_firmware for details
 
 ---------------------------------------------------------------------------
 
@@ -5282,7 +5282,7 @@ Version: 1.5
 File: mediatek/mt7662u_rom_patch.bin
 Version: 0.0.2_P48
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5295,7 +5295,7 @@ Version: 20190114
 File: mediatek/mt7615_rom_patch.bin
 Version: 20190114
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5306,7 +5306,7 @@ Version: 20200630
 File: mediatek/mt7622_rom_patch.bin
 Version: 20190114
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5322,7 +5322,7 @@ Version: 7663e2-1802-19091404338b809
 File: mediatek/mt7663_n9_rebb.bin
 Version: 7663mp1827-20190914043434
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5380,7 +5380,7 @@ Version: 20221208201745a
 File: mediatek/mt7981_wo.bin
 Version: 20221208202138
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5391,7 +5391,7 @@ Version: 20230526130917a
 File: mediatek/WIFI_RAM_CODE_MT7961_1.bin
 Version: 20230526130958
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5400,7 +5400,7 @@ Driver: mt7921 - MediaTek MT7921 bluetooth chipset
 File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
 Version: 20230526131214
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5411,7 +5411,7 @@ Version: 20230627143702a
 File: mediatek/WIFI_RAM_CODE_MT7922_1.bin
 Version: 20230627143946
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -5420,7 +5420,7 @@ Driver: mt7922 - MediaTek MT7922 bluetooth chipset
 File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
 Version: 20230627144220
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 Driver: nfp - Netronome Flow Processor
@@ -5513,7 +5513,7 @@ File: netronome/bpf/nic_AMDA0078-0011_1x100.nffw
 Version: v2.0.6.124
 
 
-Licence: Redistributable. See LICENCE.Netronome for details
+License: Redistributable. See LICENSE.Netronome for details
 
 --------------------------------------------------------------------------
 
@@ -5523,7 +5523,7 @@ File: wil6210.fw
 File: wil6210.brd
 Version: 5.2.0.18
 
-Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
+License: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
 --------------------------------------------------------------------------
 
@@ -5558,7 +5558,7 @@ File: qcom/vpu-2.0/venus.mbn
 
 Version: VIDEO.VPU.2.0-00049-PROD-1
 
-Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
 Binary files supplied originally from
 https://developer.qualcomm.com/hardware/dragonboard-410c/tools
@@ -5572,7 +5572,7 @@ Version: 3.3
 File: imx/sdma/sdma-imx7d.bin
 Version: 4.2
 
-Licence: Redistributable. See LICENSE.sdma_firmware for details
+License: Redistributable. See LICENSE.sdma_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -5603,7 +5603,7 @@ File: qcom/leia_pfp_470.fw
 File: qcom/leia_pm4_470.fw
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 
-Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
 Binary files supplied originally from
 https://developer.qualcomm.com/hardware/dragonboard-410c/tools
@@ -5615,7 +5615,7 @@ Driver: adreno - Qualcomm Adreno GPU firmware
 File: qcom/yamato_pfp.fw
 File: qcom/yamato_pm4.fw
 
-Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato for details
+License: Redistributable, BSD-3-Clause license, See LICENSE.qcom_yamato for details
 
 Binary files generated from header files in EfikaMX kernel sources. A prefix of
 four zero bytes was prepended to make them work with the DRM MSM driver. See
@@ -5656,7 +5656,7 @@ File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
 
-Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
 Binary files supplied originally from
 http://releases.linaro.org/96boards/dragonboard410c/qualcomm/firmware/linux-board-support-package-r1036.1.zip
@@ -5678,7 +5678,7 @@ File: qcom/sdm845/modem_nm.mbn
 File: qcom/sdm845/modemuw.jsn
 Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
 
-Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
+License: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
 Binary files supplied originally from
 http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20221121000000-v5.zip
@@ -5759,7 +5759,7 @@ File: mellanox/mlxsw_spectrum2-29.2012.1012.mfa2
 File: mellanox/mlxsw_spectrum3-30.2012.1012.mfa2
 File: mellanox/mlxsw_spectrum4-34.2012.1012.mfa2
 
-Licence:
+License:
  Copyright (c) 2017-2020 Mellanox Technologies, Ltd. All rights reserved.
 
  Redistribution and use in source and binary forms, with or without
@@ -5797,7 +5797,7 @@ Driver: cdns-mhdp - Cadence MHDP8546 DP bridge
 File: cadence/mhdp8546.bin
 Version: 2.1.0
 
-Licence: Redistributable. See LICENCE.cadence for details
+License: Redistributable. See LICENSE.cadence for details
 
 --------------------------------------------------------------------------
 
@@ -5819,7 +5819,7 @@ File: dpaa2/mc/mc_10.28.1_ls1088a.itb
 File: dpaa2/mc/mc_10.28.1_ls2088a.itb
 File: dpaa2/mc/mc_10.28.1_lx2160a.itb
 
-Licence: Redistributable. See LICENSE.nxp_mc_firmware for details
+License: Redistributable. See LICENSE.nxp_mc_firmware for details
 
 --------------------------------------------------------------------------
 
@@ -5828,7 +5828,7 @@ Driver: mscc-phy - Microchip PHY drivers
 File: microchip/mscc_vsc8574_revb_int8051_29e8.bin
 File: microchip/mscc_vsc8584_revb_int8051_fb48.bin
 
-Licence: Redistributable. See LICENCE.microchip for details
+License: Redistributable. See LICENSE.microchip for details
 
 --------------------------------------------------------------------------
 
@@ -5850,7 +5850,7 @@ File: meson/vdec/gxm_h264.bin
 File: meson/vdec/sm1_hevc_mmu.bin
 File: meson/vdec/sm1_vp9_mmu.bin
 
-Licence: Redistributable. See LICENSE.amlogic_vdec for details.
+License: Redistributable. See LICENSE.amlogic_vdec for details.
 
 --------------------------------------------------------------------------
 
@@ -5874,7 +5874,7 @@ Driver: inside-secure -- Inside Secure EIP197 crypto driver
 File: inside-secure/eip197_minifw/ipue.bin
 File: inside-secure/eip197_minifw/ifpp.bin
 
-Licence: Redistributable.
+License: Redistributable.
 Copyright (c) 2019 Verimatrix, Inc.
 
 Derived from proprietary unpublished source code.
@@ -5892,7 +5892,7 @@ File: mrvl/prestera/mvsw_prestera_fw-v4.0.img
 File: mrvl/prestera/mvsw_prestera_fw-v4.1.img
 File: mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img
 
-Licence: Redistributable. See LICENCE.Marvell for details.
+License: Redistributable. See LICENSE.Marvell for details.
 
 ------------------------------------------------
 
@@ -5913,7 +5913,7 @@ File: wfx/brd4001a.pds
 File: wfx/brd8022a.pds
 File: wfx/brd8023a.pds
 
-Licence: Redistributable. See wfx/LICENCE.wf200 for details.
+License: Redistributable. See wfx/LICENSE.wf200 for details.
 
 The firmware itself originates from https://github.com/SiliconLabs/wfx-firmware
 
@@ -5928,7 +5928,7 @@ Driver: wave5 - Chips&Media, Inc. video codec driver
 
 File: cnm/wave521c_k3_codec_fw.bin
 
-Licence: Redistributable. See LICENCE.cnm for details.
+License: Redistributable. See LICENSE.cnm for details.
 
 ---------------------------------------------------------------------------
 
@@ -5948,7 +5948,7 @@ File: mrvl/cpt04/se.out
 File: mrvl/cpt04/ie.out
 Version: v1.21
 
-Licence: Redistributable. See LICENCE.Marvell for details.
+License: Redistributable. See LICENSE.Marvell for details.
 
 ---------------------------------------------------------------------------
 
@@ -5959,11 +5959,11 @@ Version: 1.8.8
 File: amphion/vpu/vpu_fw_imx8_enc.bin
 Version: 1.3.4
 
-Licence: Redistributable. See LICENSE.amphion_vpu for details
+License: Redistributable. See LICENSE.amphion_vpu for details
 
 ---------------------------------------------------------------------------
 
-Driver: cs35l41_hda - CS35l41 ALSA HDA audio driver
+Driver: cs35l41_hda - CS35l41 ALSA HAD audio driver
 
 File: cirrus/cs35l41-dsp1-spk-prot.wmfw
 File: cirrus/cs35l41-dsp1-spk-prot.bin
@@ -6561,7 +6561,7 @@ File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
 File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
 Version: v0.4.1
 
-Licence: Redistributable. See LICENCE.mediatek for details.
+License: Redistributable. See LICENSE.mediatek for details.
 
 --------------------------------------------------------------------------
 
@@ -6569,7 +6569,7 @@ Driver: nxp-sr1xx - NXP Ultra Wide Band driver
 File: nxp/sr150_fw.bin
 Version: 44.00.02
 
-Licence: Redistributable. See LICENSE.nxp for details
+License: Redistributable. See LICENSE.nxp for details
 Originates from https://github.com/NXP/uwb-NXPUWB-FW.git
 --------------------------------------------------------------------------
 
@@ -6589,7 +6589,7 @@ Version: 17.92.1.p136.24
 File: nxp/uartspi_n61x_v1.bin.se
 Version: 18.99.1.p154.40
 
-Licence: Redistributable. See LICENSE.nxp for details
+License: Redistributable. See LICENSE.nxp for details
 
 Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2.0.0/nxp
 
@@ -6599,6 +6599,6 @@ Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
 File: qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
 Version: v0.1.0
 
-Licence: Redistributable. See LICENCE.linaro for details
+License: Redistributable. See LICENSE.linaro for details
 Originates from https://git.linaro.org/people/srinivas.kandagatla/audioreach-topology.git
 --------------------------------------------------------------------------
diff --git a/wfx/LICENCE.wf200 b/wfx/LICENSE.wf200
similarity index 100%
rename from wfx/LICENCE.wf200
rename to wfx/LICENSE.wf200
-- 
2.25.1

