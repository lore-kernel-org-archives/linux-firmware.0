Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346BCC001E0
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EB82C433CA; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CA99C433C7;
	Tue, 15 Aug 2023 18:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CA99C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmvl9DuQFAH3OPVXMqSzss3qSfXXFcOfvySS3nY+pYRy1ahbHbkgs5ENaOM53LVhGidQZgQsOJUu2Vp/vAzDIiqpB6C1D30YTv+X2sfGxLMqbLwaE+F3pXJpkCQYtRx/UXTxq0lL9vJmeHMV/QTnqMqyN07FJ9KyNlodNtTxm67PA8M/DhxzH42rZwRd/nMJaF+ugudEx8PljvUTAsXJjaUCnahdhRwGaBsxHX2yvdWrb72tIIQ7nL4BPnevchSFBaqU0q9Btv1ZkP8d1/whYx//sI+EX6ZL8BDbtvvkS8CqPXB8tI2+2sunZYUwhp8ssSAAar3HLNM3ndtgzBUCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR0fwQFGmBElxrnJflE6Udzz+foGw7qV7vDxgtVjMLY=;
 b=Gj2X56vXCvHq72zlJY3S0C0EpLwmF7AxbRQPD5CZ4zPmkkOkR4MTq9Qla9/d35w3SsCa8u18AqhKYGpj+vSsb4Ci/jrL1u3ix3f6Qi5FYpFfJhUETEFkdcY+aFehOGba6GRaL4uBFanGXaQPHoTK2/HM24tQLNjza3OGH+dtVw+k+MfKr3tgJpK2pV/bXsLHDAtajTHwrZbAm1ruBJ+0hPHAGunr0CrawLEXdO505lQibc/C4iu/s3/gZJvkN73SJ6GrDxS+QnmqZ/X0kw+vceispFA+ABoe0Hwio/8G9UslllHhsxLZKay8eSrf0yXcCeBoGxFmJRRM5a+kF8g8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR0fwQFGmBElxrnJflE6Udzz+foGw7qV7vDxgtVjMLY=;
 b=OpbnqhFcBDUm2HXUXj3MIUeAcCpXIn5zUdib5vR/LB0bxKotXGHWgZGSqG7x/xOPikHomTOtoEcFe+wZhJk9IPMRGW1m5lcgFidvh2MzonQoMYcWLSosE24wnLRaxbuVkjgCdJog0gpcit2PPmX2hFBaEtJokjplDIh8EWO1iEg=
Received: from CH2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:610:51::12)
 by MW3PR12MB4586.namprd12.prod.outlook.com (2603:10b6:303:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:38 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::91) by CH2PR15CA0002.outlook.office365.com
 (2603:10b6:610:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:36 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 00/20] Add preparations to be able to run in a CI/CD system
Date: Tue, 15 Aug 2023 12:59:58 -0500
Message-ID: <20230815180018.25554-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MW3PR12MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: a2258027-278c-46e6-cdad-08db9db987a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gA8ziEe4/C9Z5WlFpX/k3rFzkWX6ZlQ1LxpGiOxOed5TlYt1qexnz5DCZlZ/xHu9osz+D4uOoSLCvXbYwY2i5czJPB1N67k6EPz+r/N4a9EgqYSUWGog2ADY1/3g5MpZWDwqAgpB9gAOS71KKAb10b8uVgcb6FeWh2KGFoZhqSPhxABsRoUjSOrtS+ovdpF4+a3k3qQ+Irok/Q35CNAwrs4zAqojDnSeJW2dz2haqwN+cEkknOqa4KT5MGrB1QpuxpULrNI2Pn9Q8I4hXTm01KW+stOezLkJTLPMVh2BDN3ZBU6qOvn0xWcTqEopDgosz0XCQY+6d5yAhzDxCmSa7VaQNp3tOdGc77SmjtGj7whmiNzDqomtNSK4nluWkt9fS6TdrmRh9vjTBkVRAojIStkPkmMwDJk16m0rnZFPJaQeOZD3jTb6JqgTtWF5xUy9Vnh9U5NAd8PtsCJHeTq7baq3/8Qs+t8Q4jxNyATnFgxX/WeH3Jt16b+epkQlD7YCa1pDwyBiSU+kudSQMDAUUpiPs4n0UZUH70CeaXFHO0ghLPfKURH0m9K8CwWQn1bbCp/he8q018KayEDoPgvWfHHSfoaKaLDc2pBTmvHxtGl9SaCsYdlh5g223nZJMzmuOgmYDSwFk+9fBc11MLkSR6W2NCA8UBjaet8hsN7Z+2h9gi1yZz/liA7wLqsi6EoLyAMY0dlWXt8hzE0ncRWSegIxCt1QEgKR7rSSsZypgJDX8w1aIHxjXpPrmEzGoFQpTcP/tvXf/qoMETblYFho55dEXEy5IdVwH+U8sZjH2cGcYycEsF1DfG4kCou7RzvE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(19627235002)(44832011)(110136005)(2906002)(82740400003)(70586007)(356005)(81166007)(70206006)(40460700003)(86362001)(83380400001)(40480700001)(36860700001)(478600001)(2616005)(36756003)(41300700001)(5660300002)(8936002)(316002)(6666004)(26005)(8676002)(450100002)(4326008)(1076003)(16526019)(336012)(7696005)(47076005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:37.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2258027-278c-46e6-cdad-08db9db987a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4586

If linux-firmware.git or a fork of it is hosted in Gitlab there is the
ability to gate pull requests based on some CI checks.

The basic ones that come to mind are:
1. Checking spelling.
2. Checking WHENCE.
3. Checking for SoB.
4. Ensure that any python scripts pass style for 'black'.

All of the checks can be triggered by `pre-commit` or by `make check`

This series cleans up linux-firmware.git so all those would pass and
adds some templates to that effect.

Mario Limonciello (20):
  ath11k: update typographical errors in the Notice.txt files
  ath10k: correct typographical errors in the Notice.txt files
  i915: correct typographical errors caught by codespell
  adsp_sst: correct typographical errors caught by codespell
  agere: correct typographical errors in LICENSE caught by codespell
  qca: correct typographical errors in NOTICE.txt caught by codespell
  usbdux: correct typographical errors caught by codespell
  dsp56k: correct typographical error caught by codespell
  cxgb4: correct typographical errors caught by codespell
  cavium_liquidio: fix typographical errors caught by codespell
  kaweth: correct typographical errors caught by codespell
  xc5000c: correct typographical errors caught by codespell
  qcom: correct typographical errors caught by codespell
  keyspan_pda: correct typographical errors caught by codespell
  carl9170fw: correct typographical errors caught by codespell
  WHENCE: correct typographical errors caught by codespell
  check_whence: reformat using python black
  Add CI/CD with ci-fairy
  Wire up pre-commit to `make check`
  Rewrite README in markdown

 .codespell.cfg                                |   4 +
 .gitignore                                    |   1 +
 .gitlab-ci.yml                                |  22 +
 .pre-commit-config.yaml                       |  33 ++
 LICENCE.Abilis => LICENSE.Abilis              |   0
 LICENCE.IntcSST2 => LICENSE.IntcSST2          |   0
 LICENCE.Marvell => LICENSE.Marvell            |   0
 LICENCE.NXP => LICENSE.NXP                    |   0
 LICENCE.Netronome => LICENSE.Netronome        |   0
 LICENCE.OLPC => LICENSE.OLPC                  |   0
 LICENCE.adsp_sst => LICENSE.adsp_sst          |   4 +-
 LICENCE.agere => LICENSE.agere                |   2 +-
 ...heros_firmware => LICENSE.atheros_firmware |   0
 ...oadcom_bcm43xx => LICENSE.broadcom_bcm43xx |   0
 LICENCE.ca0132 => LICENSE.ca0132              |   0
 LICENCE.cadence => LICENSE.cadence            |   0
 LICENCE.cavium => LICENSE.cavium              |   0
 ...cavium_liquidio => LICENSE.cavium_liquidio |   4 +-
 ...elsio_firmware => LICENSE.chelsio_firmware |   0
 LICENCE.cnm => LICENSE.cnm                    |   0
 LICENCE.cw1200 => LICENSE.cw1200              |   0
 LICENCE.cypress => LICENSE.cypress            |   0
 LICENCE.e100 => LICENSE.e100                  |   0
 LICENCE.ene_firmware => LICENSE.ene_firmware  |   0
 LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28    |   0
 LICENCE.go7007 => LICENSE.go7007              |   0
 LICENSE.i915                                  |  78 ++--
 LICENCE.ibt_firmware => LICENSE.ibt_firmware  |   0
 LICENCE.it913x => LICENSE.it913x              |   0
 ...lwifi_firmware => LICENSE.iwlwifi_firmware |   0
 LICENCE.kaweth => LICENSE.kaweth              |   2 +-
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
 LICENCE.xc5000c => LICENSE.xc5000c            |   2 +-
 Makefile                                      |   6 +-
 README                                        |  43 --
 README.md                                     |  54 +++
 WHENCE                                        | 432 +++++++++---------
 .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
 .../hw2.1/notice_ath10k_firmware-5.txt        | 138 +++---
 .../hw3.0/notice_ath10k_firmware-4.txt        | 144 +++---
 .../hw3.0/notice_ath10k_firmware-6.txt        |  32 +-
 .../hw3.0/notice_ath10k_firmware-sdio-6.txt   |  32 +-
 .../hw1.0/notice_ath10k_firmware-5.txt        | 138 +++---
 .../hw1.0/notice_ath10k_firmware-6.txt        |  32 +-
 .../hw1.0/notice_ath10k_firmware-sdio-5.txt   | 138 +++---
 .../hw1.0/notice_ath10k_firmware-5.txt        |   8 +-
 .../hw2.0/notice_ath10k_firmware-5.txt        |  40 +-
 .../hw2.0/notice_ath10k_firmware-4.txt        |   8 +-
 .../hw2.0/notice_ath10k_firmware-5.txt        |   8 +-
 .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
 .../hw2.0/notice_ath10k_firmware-5.txt        |  26 +-
 ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp      |  26 +-
 ath11k/IPQ5018/hw1.0/Notice.txt               |  28 +-
 ath11k/IPQ6018/hw1.0/Notice.txt               |  28 +-
 ath11k/IPQ8074/hw2.0/Notice.txt               |  28 +-
 ath11k/QCA6390/hw2.0/Notice.txt               | 100 ++--
 ath11k/QCN9074/hw1.0/Notice.txt               |  28 +-
 ath11k/WCN6750/hw1.0/Notice.txt               | 164 +++----
 ath11k/WCN6855/hw2.0/Notice.txt               |  26 +-
 carl9170fw/carlfw/Kconfig                     |   2 +-
 carl9170fw/carlfw/carl9170.lds                |   4 +-
 carl9170fw/carlfw/include/dma.h               |   2 +-
 carl9170fw/carlfw/src/wlan.c                  |   4 +-
 carl9170fw/carlfw/src/wol.c                   |   2 +-
 carl9170fw/extra/FindGPERF.cmake              |   2 +-
 .../extra/FindPackageHandleStandardArgs.cmake |   8 +-
 carl9170fw/include/shared/fwcmd.h             |   2 +-
 carl9170fw/include/shared/phy.h               |   2 +-
 carl9170fw/tools/carlu/src/fw.c               |   2 +-
 carl9170fw/tools/carlu/src/test.c             |   4 +-
 carl9170fw/tools/carlu/src/usb.c              |   6 +-
 carl9170fw/tools/include/frame.h              |  12 +-
 check_whence.py                               |  89 ++--
 cxgb4/configs/t4-config-default.txt           |   6 +-
 cxgb4/configs/t5-config-default.txt           |   6 +-
 cxgb4/configs/t5-config-hashfilter.txt        |   6 +-
 cxgb4/configs/t6-config-default.txt           |   6 +-
 cxgb4/configs/t6-config-hashfilter.txt        |   8 +-
 dsp56k/concat-bootstrap.pl                    |   2 +-
 keyspan_pda/keyspan_pda.S                     |   4 +-
 keyspan_pda/xircom_pgs.S                      |   4 +-
 qca/NOTICE.txt                                |   6 +-
 qcom/NOTICE.txt                               |  16 +-
 usbdux/usbdux_firmware.asm                    |  16 +-
 usbdux/usbduxfast_firmware.asm                |   6 +-
 usbdux/usbduxsigma_firmware.asm               |  14 +-
 wfx/{LICENCE.wf200 => LICENSE.wf200}          |   0
 111 files changed, 1137 insertions(+), 1043 deletions(-)
 create mode 100644 .codespell.cfg
 create mode 100644 .gitignore
 create mode 100644 .gitlab-ci.yml
 create mode 100644 .pre-commit-config.yaml
 rename LICENCE.Abilis => LICENSE.Abilis (100%)
 rename LICENCE.IntcSST2 => LICENSE.IntcSST2 (100%)
 rename LICENCE.Marvell => LICENSE.Marvell (100%)
 rename LICENCE.NXP => LICENSE.NXP (100%)
 rename LICENCE.Netronome => LICENSE.Netronome (100%)
 rename LICENCE.OLPC => LICENSE.OLPC (100%)
 rename LICENCE.adsp_sst => LICENSE.adsp_sst (99%)
 rename LICENCE.agere => LICENSE.agere (98%)
 rename LICENCE.atheros_firmware => LICENSE.atheros_firmware (100%)
 rename LICENCE.broadcom_bcm43xx => LICENSE.broadcom_bcm43xx (100%)
 rename LICENCE.ca0132 => LICENSE.ca0132 (100%)
 rename LICENCE.cadence => LICENSE.cadence (100%)
 rename LICENCE.cavium => LICENSE.cavium (100%)
 rename LICENCE.cavium_liquidio => LICENSE.cavium_liquidio (97%)
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
 rename LICENCE.kaweth => LICENSE.kaweth (97%)
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
 rename LICENCE.xc5000c => LICENSE.xc5000c (93%)
 delete mode 100644 README
 create mode 100644 README.md
 rename wfx/{LICENCE.wf200 => LICENSE.wf200} (100%)

-- 
2.25.1

