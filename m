Return-Path: <SRS0=kQig=4R=gmail.com=digetx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D10C4332F
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Dec 2022 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AF6FC433D2; Mon, 19 Dec 2022 16:58:31 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56D79C433EF
	for <linux-firmware@kernel.org>; Mon, 19 Dec 2022 16:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56D79C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id j4so14666903lfk.0
        for <linux-firmware@kernel.org>; Mon, 19 Dec 2022 08:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfgA94o+L+JwjyMViM+dmuBfOj+sR9+fodgHjNCDPIc=;
        b=XDka8hwiCmIKbWq5boFWICWXRCSKzosi6lL8keuCg9VWNfPQvwFGBLMgmFufwRSoUy
         AFAFg9yiaXdmTaVEi7JhxCCASNlMEINY0AIOffjsoaJGp56adNMHg1zV30nbOUaEJdWo
         WDB799peblpbl/lafk2nSwz0jPhIhdtpN8LnM19IYwbebLaYNyasaNcYJU0/PPR6543i
         yU+w9UuYVxWMFs8S6hYrNqfCzxojTwdANPcK2hN2UfF59DjJfIbo3WDhdM5L7U7NqvUf
         KeLgj/ffdpwZFkUJRACvhM+fteSA8xW3Eq7hBBTSo5Xn7nACdm/mWMNDap3QDLw0OVOO
         G4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfgA94o+L+JwjyMViM+dmuBfOj+sR9+fodgHjNCDPIc=;
        b=Fp0VbvJ/j5KwKOahCAlk8HTKVi2QPYCROOWp7CIKiln7uMMWNltjqir2+Rm2H9ado9
         1lpApbX8vOCaXaWHDw/9FUCmY/O3dAjm7kC/TwF33hyD/aWsWP7Z3sqJqZRn8EALOHnB
         Tg7Q8xoVKIxm2YJ51rCB/ehp3MT/BIFZpMdJKPOTSyZX6SHnwCB+jAvH4obj2OekwCuf
         xn7/pcSYvbjzI8UnwJK9IS+mskAugkTxh8uA/xRx9pwTzRSLzFldYyzSmF5InCh9gZUE
         6FfoI/felhJf9QstTljPsf6MM3fpWlYRXaGGb4iPgDQBPzREyfVKZIiuZMwXL7s2+uiR
         xguA==
X-Gm-Message-State: ANoB5pl4fKDwu3n5cTbhCUpdLhGXXqkoH4Xgohj3xTyIp9N8h3kLc9yw
	c4MFHxDVpISlmvqgww1F4Xs=
X-Google-Smtp-Source: AA0mqf7ih3veFH79UTf8fW7NHTFJRcjsag3lqu4MD9/wldbwzcgyHoNDfaJJwaSpnNzLaxXZXaatOg==
X-Received: by 2002:a05:6512:2a8f:b0:4aa:8811:4c59 with SMTP id dt15-20020a0565122a8f00b004aa88114c59mr13176126lfb.28.1671469108359;
        Mon, 19 Dec 2022 08:58:28 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru. [109.252.113.89])
        by smtp.googlemail.com with ESMTPSA id 7-20020ac25f47000000b004aac23e0dd6sm1152531lfz.29.2022.12.19.08.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 08:58:27 -0800 (PST)
Message-ID: <812120ff-2fcd-e05e-7748-6a731e782811@gmail.com>
Date: Mon, 19 Dec 2022 19:58:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/8] brcm: update bcm4329 firmware file
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-wireless@vger.kernel.org,
 "brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>,
 SHA-cyfmac-dev-list@infineon.com, linux-firmware@kernel.org
References: <20221207230556.383935-1-arend.vanspriel@broadcom.com>
 <20221207230556.383935-3-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221207230556.383935-3-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

08.12.2022 02:05, Arend van Spriel пишет:
> bump version from 4.220.48.0 to 4.218.248.44. Version numbering
> scheme is obscure but this is a more recent firmware file.
> 
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  brcm/brcmfmac4329-sdio.bin | Bin 253748 -> 246791 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

This firmware version doesn't work on any of NVIDIA Tegra tablets
supported by upstream kernel, tested using next-20221216. Please revert
or fix, thanks!

Faulty 4.218.248.44 kernel log:

brcmfmac: brcmf_wcc_attach: executing
brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2),
device may have limited channels available
brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4329/3 wl0: May 25 2012
17:57:45 version 4.218.248.44
ieee80211 phy0: brcmf_c_set_joinpref_default: Set join_pref error (-52)
ieee80211 phy0: brcmf_setup_wiphybands: rxchain unsupported
ieee80211 phy0: brcmf_construct_chaninfo: get chanspecs error (-52)
ieee80211 phy0: brcmf_setup_wiphybands: brcmf_construct_chaninfo failed
(-52)
ieee80211 phy0: brcmf_cfg80211_attach: Setting wiphy bands failed (-52)
ieee80211 phy0: brcmf_bus_started: failed: -12
ieee80211 phy0: brcmf_attach: dongle is not responding: err=-12
brcmfmac: brcmf_wcc_detach: executing
brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed

Good 4.220.48.0 kernel log:

brcmfmac: brcmf_wcc_attach: executing
brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2),
device may have limited channels available
brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4329/3 wl0: Sep  2 2011
14:48:19 version 4.220.48
ieee80211 phy0: brcmf_setup_wiphybands: rxchain unsupported
