Return-Path: <SRS0=TWCN=E7=linaro.org=stanimir.varbanov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832FDC56201
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Nov 2020 16:02:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 43F4120BED; Wed, 25 Nov 2020 16:02:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93E62087C
	for <linux-firmware@kernel.org>; Wed, 25 Nov 2020 16:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wh6ZKgpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93E62087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=stanimir.varbanov@linaro.org
Received: by mail-wm1-f42.google.com with SMTP id p19so1855492wmg.0
        for <linux-firmware@kernel.org>; Wed, 25 Nov 2020 08:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
        b=wh6ZKgptF2+qYD0yEthHOAgj7pIBNSvshKJII2U46GmfjCiXOs87Toyd06mWtOIPRZ
         gZgguxqEWZHChR41Q8h7pejygqsWzIiC7Gtpq8UF9pHIKzwW4vLB+kJ13J3MU4UZKtSx
         5UghkCEAH/JrOEjHtYSg6quRzQfNbxeECYLLe9JtVO0l3R5LdO5+EXRJ1i68QaqKCQzZ
         Wp7pDOPgit1s1rTCZy4UqrPeVYD/Pu/MCnCTRSaVA8QTmEIG08IpzJ/Hhajk9P6BolrC
         d8Ut7Xd1Wvd00VGgGgqRYZ1KMMfSSPL+P46QQjVt//IWvoQzDG6zs3iGkNR7hPk7y3en
         yoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=faq1+9tTPdxCtY6FguahbIN67FRejTlywlCZQqt2oe8=;
        b=sUtA6vEjdJRR5Fq9WbCEv2c6fMgU47t4a5jnRIfg0f8Cil4z0QVsV8VWCuIpwxqTC2
         LKjOnQUMbkfLXC22pgJTpjNDO+Kkz7lVYyqxowg+u/OA8Yb5XPU4aLH79lBKzfRwv3bj
         Jt+f4jyZ+OtJMpai+xTBRcCz8aznuqFYgaZAhMitkuxDjpyAYZrIzPOX746lhxhXrawz
         P9fnqw4ddC2qxqj8RqAih3FTNCO7AEznL34w3CJimnEMiJwYJR/olO7J0WL/E2kZgCqS
         5jQRhH9TxZ7rUNxHC2jJMe2DtU67WzyiusSxZuLTOAeLUT8w+ayFsU3rObJaeGdhPANf
         PVkg==
X-Gm-Message-State: AOAM532FPvfsdnwSPSzNw/tYIZg0iT5Lvx+CyYhJbhB1Dps67k/ogTSU
	UEBAPMO/YZZumu6RX50qEUeztw==
X-Google-Smtp-Source: ABdhPJyQNKoY/euMK6ZNcUesyn+9MjGKx1xKvWODLY1oc209ES/XbDBtdKUVvLPEyxPL5ITqdOlyWw==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr4703972wme.51.1606320166784;
        Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Received: from [192.168.0.3] (hst-221-81.medicom.bg. [84.238.221.81])
        by smtp.googlemail.com with ESMTPSA id k16sm5581374wrl.65.2020.11.25.08.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 08:02:46 -0800 (PST)
Subject: Re: Update venus firmware files for v5.4 and v5.2
List-Id: <linux-firmware.lore.kernel.org>
To: asitshah@codeaurora.org, linux-firmware@kernel.org,
 linux-arm-kernel@lists.infradead.org, mchehab@infradead.org,
 linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
 linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org, sampnimm@codeaurora.org
References: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c7da805a-65a8-6011-e710-b7ffa29492a3@linaro.org>
Date: Wed, 25 Nov 2020 18:02:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <78c092f9b8d8b3833d7ac4f36253f7d3@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Asit,

with 5.2/venus updated firmware I see following errors while loading
venus driver:

Nov 25 15:57:50 linaro-developer kernel: [418683.609209] qcom-venus
aa00000.video-codec: invalid firmware metadata
Nov 25 15:57:50 linaro-developer kernel: [418683.616354] qcom-venus
aa00000.video-codec: fail to load video firmware
Nov 25 15:57:50 linaro-developer kernel: [418683.631439] qcom-venus:
probe of aa00000.video-codec failed with error -22

Please don't merge it in linux-firmware until we are not sure what is
going on here!

On 11/25/20 10:41 AM, asitshah@codeaurora.org wrote:
> Hi Team,
> 
> Please include updated Venus Firmware bins for v5.4 and v5.2 .
> 
> Snapshot of pull request is as below, let me know if anything is missing.
> 
>>>>>>>
> 
> The following changes since commit
> b362fd4cb8963ad75517dbcf424974f65a29a60e:
> 
>   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2018 (2020-11-24
> 09:55:03 -0500)
> 
> are available in the git repository at:
> 
>   https://github.com/shahasit/linux-firmware-video/tree/master
> 
> for you to fetch changes up to e6459dce893a5b8dbf684762d5396acc11149186:
> 
>   qcom : updated venus firmware files for v5.2 (2020-11-25 14:02:10 +0530)
> 
> ----------------------------------------------------------------
> Asit Shah (2):
>       qcom : updated venus firmware files for v5.4
>       qcom : updated venus firmware files for v5.2
> 
>  qcom/venus-5.2/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.2/venus.b01 | Bin 6600 -> 6808 bytes
>  qcom/venus-5.2/venus.b02 | Bin 837304 -> 856432 bytes
>  qcom/venus-5.2/venus.b03 | Bin 33640 -> 33648 bytes
>  qcom/venus-5.2/venus.mbn | Bin 883264 -> 902400 bytes
>  qcom/venus-5.2/venus.mdt | Bin 6812 -> 7020 bytes
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 873680 -> 873704 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn | Bin 919792 -> 919816 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  12 files changed, 0 insertions(+), 0 deletions(-)
> 
> <<<<<<
> 
> Regards,
> Asit

-- 
regards,
Stan
