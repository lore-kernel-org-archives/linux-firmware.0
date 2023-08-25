Return-Path: <SRS0=RAXe=EK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9760AC3DA6F
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Aug 2023 17:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63F0BC433C8; Fri, 25 Aug 2023 17:22:39 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8558C433C7
	for <linux-firmware@kernel.org>; Fri, 25 Aug 2023 17:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8558C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso2804066b.2
        for <linux-firmware@kernel.org>; Fri, 25 Aug 2023 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692984156; x=1693588956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zqmhzv8h1IcVKxuLLSrqS8T0Gp6PWF+v4EZGxSC0e8=;
        b=fDRwISPOH55USawdjHzJ5+MV/OjeARho2mE6C9puFp0F08WftgAkTqx2yfRhwDBay/
         HktZ9u7Wa7IdqDDwEKUOnAyGjeuBczL35R7dxNCledvWS5BXc3KSttGQ/X2Hw1Pgywls
         drdORi2SV597QzXrTU2dXEHIZ5/oPgx6N8l8MzDYTULBTppEXh4Clz5GdiBId2bN2X9M
         cFuzPMuZm/+xDgc8QMLfS3sSNmx5vvJoKk+NwCrlnCZjSMAeX0U3yXHMgU+3p8ppbwTB
         5xRfz5+b+iaOWR/V6tf2Mh9ZRoSYpdDtNfEMXctEdhrp8hbwIcWVl9vibyh25ZoZ0RK0
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692984156; x=1693588956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zqmhzv8h1IcVKxuLLSrqS8T0Gp6PWF+v4EZGxSC0e8=;
        b=NXyF0OqY5zEB+NbibBvpIX9ykHPhKm2Lu9qbPoMvizVdamlfOZP67ChEQ4nJ+FIKtX
         j1HuY/ghHLlR32O2/uWXTLEBJmBKs9zSvDXOdnp2Jlg2BhG24Kl2U8g+5gP8Y3uzRR7w
         xMSX5LGkhOJEE9Hj26h1xoTpkG0LaFtx1OZol6yM+r0xXI9bSwhaPYVBIy32VQtxEJhO
         8fnYMPXPEa/b2pYhK5AH51+q32Zj8ej/s87zF0uzX/hm9YP4zBMi/8/upZ4DyjvMrjwT
         GJIbd481rlpAWydCz7DUPGxkyMBB59EawZr6tH+Tidk+qOjS523VqTYclRBuQ140W3pH
         qB9A==
X-Gm-Message-State: AOJu0Yz0A9wHEQ6fMj76zm6/dlRxBXQssWesqMezFaq3I+QdMkg99jTF
	16vjXRAy7/9SxubdYJiZC3h/WA==
X-Google-Smtp-Source: AGHT+IGUSNYSvImXb1T3Aa9AS9ZZnfq3vqc7rlFfhpkUEw+D7TPLftYPf7Jjy/Bfnh3JzgQJclpx9Q==
X-Received: by 2002:a17:906:3287:b0:991:fef4:bb9 with SMTP id 7-20020a170906328700b00991fef40bb9mr14751878ejw.58.1692984155616;
        Fri, 25 Aug 2023 10:22:35 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id rn14-20020a170906d92e00b00992afee724bsm1152936ejb.76.2023.08.25.10.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 10:22:35 -0700 (PDT)
Message-ID: <60fcf13c-c1bb-46f4-86bc-d3c674d0bf4b@linaro.org>
Date: Fri, 25 Aug 2023 20:22:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] Add preparations to be able to run in a CI/CD
 system
List-Id: <linux-firmware.lore.kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>, linux-firmware@kernel.org,
 Josh Boyer <jwboyer@kernel.org>
References: <20230815180018.25554-1-mario.limonciello@amd.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230815180018.25554-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Helo,

On 15/08/2023 20:59, Mario Limonciello wrote:
> If linux-firmware.git or a fork of it is hosted in Gitlab there is the
> ability to gate pull requests based on some CI checks.
> 
> The basic ones that come to mind are:
> 1. Checking spelling.

First, you are renaming a lot of 'licence' files to be named 'license'. 
This is fine from the US English point of view. Other (e.g. UK) English 
keep the difference between licence (noun) and license (verb). Not 
everybody uses the US English, especially for the legal documents.

Second, renaming licence files and/or changing their contents doesn't 
sound right to me. They are legally binding documents, with all the 
mistakes and typos. They are usually passed through the legal 
departments, etc. I would not guarantee that one wouldn't consider 
licence being void after these spelling corrections.

> 2. Checking WHENCE.
> 3. Checking for SoB.
> 4. Ensure that any python scripts pass style for 'black'.
> 
> All of the checks can be triggered by `pre-commit` or by `make check`
> 
> This series cleans up linux-firmware.git so all those would pass and
> adds some templates to that effect.
> 
> Mario Limonciello (20):
>    ath11k: update typographical errors in the Notice.txt files
>    ath10k: correct typographical errors in the Notice.txt files
>    i915: correct typographical errors caught by codespell
>    adsp_sst: correct typographical errors caught by codespell
>    agere: correct typographical errors in LICENSE caught by codespell
>    qca: correct typographical errors in NOTICE.txt caught by codespell
>    usbdux: correct typographical errors caught by codespell
>    dsp56k: correct typographical error caught by codespell
>    cxgb4: correct typographical errors caught by codespell
>    cavium_liquidio: fix typographical errors caught by codespell
>    kaweth: correct typographical errors caught by codespell
>    xc5000c: correct typographical errors caught by codespell
>    qcom: correct typographical errors caught by codespell
>    keyspan_pda: correct typographical errors caught by codespell
>    carl9170fw: correct typographical errors caught by codespell
>    WHENCE: correct typographical errors caught by codespell
>    check_whence: reformat using python black
>    Add CI/CD with ci-fairy
>    Wire up pre-commit to `make check`
>    Rewrite README in markdown
> 
>   .codespell.cfg                                |   4 +
>   .gitignore                                    |   1 +
>   .gitlab-ci.yml                                |  22 +
>   .pre-commit-config.yaml                       |  33 ++
>   LICENCE.Abilis => LICENSE.Abilis              |   0
>   LICENCE.IntcSST2 => LICENSE.IntcSST2          |   0
>   LICENCE.Marvell => LICENSE.Marvell            |   0
>   LICENCE.NXP => LICENSE.NXP                    |   0
>   LICENCE.Netronome => LICENSE.Netronome        |   0
>   LICENCE.OLPC => LICENSE.OLPC                  |   0
>   LICENCE.adsp_sst => LICENSE.adsp_sst          |   4 +-
>   LICENCE.agere => LICENSE.agere                |   2 +-
>   ...heros_firmware => LICENSE.atheros_firmware |   0
>   ...oadcom_bcm43xx => LICENSE.broadcom_bcm43xx |   0
>   LICENCE.ca0132 => LICENSE.ca0132              |   0
>   LICENCE.cadence => LICENSE.cadence            |   0
>   LICENCE.cavium => LICENSE.cavium              |   0
>   ...cavium_liquidio => LICENSE.cavium_liquidio |   4 +-
>   ...elsio_firmware => LICENSE.chelsio_firmware |   0
>   LICENCE.cnm => LICENSE.cnm                    |   0
>   LICENCE.cw1200 => LICENSE.cw1200              |   0
>   LICENCE.cypress => LICENSE.cypress            |   0
>   LICENCE.e100 => LICENSE.e100                  |   0
>   LICENCE.ene_firmware => LICENSE.ene_firmware  |   0
>   LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28    |   0
>   LICENCE.go7007 => LICENSE.go7007              |   0
>   LICENSE.i915                                  |  78 ++--
>   LICENCE.ibt_firmware => LICENSE.ibt_firmware  |   0
>   LICENCE.it913x => LICENSE.it913x              |   0
>   ...lwifi_firmware => LICENSE.iwlwifi_firmware |   0
>   LICENCE.kaweth => LICENSE.kaweth              |   2 +-
>   LICENCE.linaro => LICENSE.linaro              |   0
>   LICENCE.mediatek => LICENSE.mediatek          |   0
>   LICENCE.microchip => LICENSE.microchip        |   0
>   LICENCE.moxa => LICENSE.moxa                  |   0
>   ...10ge_firmware => LICENSE.myri10ge_firmware |   0
>   LICENCE.nvidia => LICENSE.nvidia              |   0
>   ...irmware => LICENSE.open-ath9k-htc-firmware |   0
>   LICENCE.phanfw => LICENSE.phanfw              |   0
>   LICENCE.qat_firmware => LICENSE.qat_firmware  |   0
>   LICENCE.qla1280 => LICENSE.qla1280            |   0
>   LICENCE.qla2xxx => LICENSE.qla2xxx            |   0
>   LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3  |   0
>   ...irmware.txt => LICENSE.ralink-firmware.txt |   0
>   ...LICENSE.ralink_a_mediatek_company_firmware |   0
>   LICENCE.rockchip => LICENSE.rockchip          |   0
>   ...rmware.txt => LICENSE.rtlwifi_firmware.txt |   0
>   LICENCE.siano => LICENSE.siano                |   0
>   ...ti-connectivity => LICENSE.ti-connectivity |   0
>   LICENCE.ti-keystone => LICENSE.ti-keystone    |   0
>   LICENCE.ti-tspa => LICENSE.ti-tspa            |   0
>   ...4-firmware => LICENSE.ueagle-atm4-firmware |   0
>   LICENCE.via_vt6656 => LICENSE.via_vt6656      |   0
>   LICENCE.wl1251 => LICENSE.wl1251              |   0
>   LICENCE.xc4000 => LICENSE.xc4000              |   0
>   LICENCE.xc5000 => LICENSE.xc5000              |   0
>   LICENCE.xc5000c => LICENSE.xc5000c            |   2 +-
>   Makefile                                      |   6 +-
>   README                                        |  43 --
>   README.md                                     |  54 +++
>   WHENCE                                        | 432 +++++++++---------
>   .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
>   .../hw2.1/notice_ath10k_firmware-5.txt        | 138 +++---
>   .../hw3.0/notice_ath10k_firmware-4.txt        | 144 +++---
>   .../hw3.0/notice_ath10k_firmware-6.txt        |  32 +-
>   .../hw3.0/notice_ath10k_firmware-sdio-6.txt   |  32 +-
>   .../hw1.0/notice_ath10k_firmware-5.txt        | 138 +++---
>   .../hw1.0/notice_ath10k_firmware-6.txt        |  32 +-
>   .../hw1.0/notice_ath10k_firmware-sdio-5.txt   | 138 +++---
>   .../hw1.0/notice_ath10k_firmware-5.txt        |   8 +-
>   .../hw2.0/notice_ath10k_firmware-5.txt        |  40 +-
>   .../hw2.0/notice_ath10k_firmware-4.txt        |   8 +-
>   .../hw2.0/notice_ath10k_firmware-5.txt        |   8 +-
>   .../hw1.0/notice_ath10k_firmware-5.txt        |  40 +-
>   .../hw2.0/notice_ath10k_firmware-5.txt        |  26 +-
>   ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp      |  26 +-
>   ath11k/IPQ5018/hw1.0/Notice.txt               |  28 +-
>   ath11k/IPQ6018/hw1.0/Notice.txt               |  28 +-
>   ath11k/IPQ8074/hw2.0/Notice.txt               |  28 +-
>   ath11k/QCA6390/hw2.0/Notice.txt               | 100 ++--
>   ath11k/QCN9074/hw1.0/Notice.txt               |  28 +-
>   ath11k/WCN6750/hw1.0/Notice.txt               | 164 +++----
>   ath11k/WCN6855/hw2.0/Notice.txt               |  26 +-
>   carl9170fw/carlfw/Kconfig                     |   2 +-
>   carl9170fw/carlfw/carl9170.lds                |   4 +-
>   carl9170fw/carlfw/include/dma.h               |   2 +-
>   carl9170fw/carlfw/src/wlan.c                  |   4 +-
>   carl9170fw/carlfw/src/wol.c                   |   2 +-
>   carl9170fw/extra/FindGPERF.cmake              |   2 +-
>   .../extra/FindPackageHandleStandardArgs.cmake |   8 +-
>   carl9170fw/include/shared/fwcmd.h             |   2 +-
>   carl9170fw/include/shared/phy.h               |   2 +-
>   carl9170fw/tools/carlu/src/fw.c               |   2 +-
>   carl9170fw/tools/carlu/src/test.c             |   4 +-
>   carl9170fw/tools/carlu/src/usb.c              |   6 +-
>   carl9170fw/tools/include/frame.h              |  12 +-
>   check_whence.py                               |  89 ++--
>   cxgb4/configs/t4-config-default.txt           |   6 +-
>   cxgb4/configs/t5-config-default.txt           |   6 +-
>   cxgb4/configs/t5-config-hashfilter.txt        |   6 +-
>   cxgb4/configs/t6-config-default.txt           |   6 +-
>   cxgb4/configs/t6-config-hashfilter.txt        |   8 +-
>   dsp56k/concat-bootstrap.pl                    |   2 +-
>   keyspan_pda/keyspan_pda.S                     |   4 +-
>   keyspan_pda/xircom_pgs.S                      |   4 +-
>   qca/NOTICE.txt                                |   6 +-
>   qcom/NOTICE.txt                               |  16 +-
>   usbdux/usbdux_firmware.asm                    |  16 +-
>   usbdux/usbduxfast_firmware.asm                |   6 +-
>   usbdux/usbduxsigma_firmware.asm               |  14 +-
>   wfx/{LICENCE.wf200 => LICENSE.wf200}          |   0
>   111 files changed, 1137 insertions(+), 1043 deletions(-)
>   create mode 100644 .codespell.cfg
>   create mode 100644 .gitignore
>   create mode 100644 .gitlab-ci.yml
>   create mode 100644 .pre-commit-config.yaml
>   rename LICENCE.Abilis => LICENSE.Abilis (100%)
>   rename LICENCE.IntcSST2 => LICENSE.IntcSST2 (100%)
>   rename LICENCE.Marvell => LICENSE.Marvell (100%)
>   rename LICENCE.NXP => LICENSE.NXP (100%)
>   rename LICENCE.Netronome => LICENSE.Netronome (100%)
>   rename LICENCE.OLPC => LICENSE.OLPC (100%)
>   rename LICENCE.adsp_sst => LICENSE.adsp_sst (99%)
>   rename LICENCE.agere => LICENSE.agere (98%)
>   rename LICENCE.atheros_firmware => LICENSE.atheros_firmware (100%)
>   rename LICENCE.broadcom_bcm43xx => LICENSE.broadcom_bcm43xx (100%)
>   rename LICENCE.ca0132 => LICENSE.ca0132 (100%)
>   rename LICENCE.cadence => LICENSE.cadence (100%)
>   rename LICENCE.cavium => LICENSE.cavium (100%)
>   rename LICENCE.cavium_liquidio => LICENSE.cavium_liquidio (97%)
>   rename LICENCE.chelsio_firmware => LICENSE.chelsio_firmware (100%)
>   rename LICENCE.cnm => LICENSE.cnm (100%)
>   rename LICENCE.cw1200 => LICENSE.cw1200 (100%)
>   rename LICENCE.cypress => LICENSE.cypress (100%)
>   rename LICENCE.e100 => LICENSE.e100 (100%)
>   rename LICENCE.ene_firmware => LICENSE.ene_firmware (100%)
>   rename LICENCE.fw_sst_0f28 => LICENSE.fw_sst_0f28 (100%)
>   rename LICENCE.go7007 => LICENSE.go7007 (100%)
>   rename LICENCE.ibt_firmware => LICENSE.ibt_firmware (100%)
>   rename LICENCE.it913x => LICENSE.it913x (100%)
>   rename LICENCE.iwlwifi_firmware => LICENSE.iwlwifi_firmware (100%)
>   rename LICENCE.kaweth => LICENSE.kaweth (97%)
>   rename LICENCE.linaro => LICENSE.linaro (100%)
>   rename LICENCE.mediatek => LICENSE.mediatek (100%)
>   rename LICENCE.microchip => LICENSE.microchip (100%)
>   rename LICENCE.moxa => LICENSE.moxa (100%)
>   rename LICENCE.myri10ge_firmware => LICENSE.myri10ge_firmware (100%)
>   rename LICENCE.nvidia => LICENSE.nvidia (100%)
>   rename LICENCE.open-ath9k-htc-firmware => LICENSE.open-ath9k-htc-firmware (100%)
>   rename LICENCE.phanfw => LICENSE.phanfw (100%)
>   rename LICENCE.qat_firmware => LICENSE.qat_firmware (100%)
>   rename LICENCE.qla1280 => LICENSE.qla1280 (100%)
>   rename LICENCE.qla2xxx => LICENSE.qla2xxx (100%)
>   rename LICENCE.r8a779x_usb3 => LICENSE.r8a779x_usb3 (100%)
>   rename LICENCE.ralink-firmware.txt => LICENSE.ralink-firmware.txt (100%)
>   rename LICENCE.ralink_a_mediatek_company_firmware => LICENSE.ralink_a_mediatek_company_firmware (100%)
>   rename LICENCE.rockchip => LICENSE.rockchip (100%)
>   rename LICENCE.rtlwifi_firmware.txt => LICENSE.rtlwifi_firmware.txt (100%)
>   rename LICENCE.siano => LICENSE.siano (100%)
>   rename LICENCE.ti-connectivity => LICENSE.ti-connectivity (100%)
>   rename LICENCE.ti-keystone => LICENSE.ti-keystone (100%)
>   rename LICENCE.ti-tspa => LICENSE.ti-tspa (100%)
>   rename LICENCE.ueagle-atm4-firmware => LICENSE.ueagle-atm4-firmware (100%)
>   rename LICENCE.via_vt6656 => LICENSE.via_vt6656 (100%)
>   rename LICENCE.wl1251 => LICENSE.wl1251 (100%)
>   rename LICENCE.xc4000 => LICENSE.xc4000 (100%)
>   rename LICENCE.xc5000 => LICENSE.xc5000 (100%)
>   rename LICENCE.xc5000c => LICENSE.xc5000c (93%)
>   delete mode 100644 README
>   create mode 100644 README.md
>   rename wfx/{LICENCE.wf200 => LICENSE.wf200} (100%)
> 

-- 
With best wishes
Dmitry

