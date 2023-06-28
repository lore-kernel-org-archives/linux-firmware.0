Return-Path: <SRS0=bvuk=CQ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20596EB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Jun 2023 17:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9791C433C9; Wed, 28 Jun 2023 17:01:36 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46807C433C8
	for <linux-firmware@kernel.org>; Wed, 28 Jun 2023 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46807C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b699284ff4so427461fa.2
        for <linux-firmware@kernel.org>; Wed, 28 Jun 2023 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687971693; x=1690563693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3jAXCPA5P+oVcmiN1WqMULNs6BS64aNdqUj2F01rxk=;
        b=JXjOOZhLiMYaMktPkAQHsDkRVYnrR7x0fyeIJbGodzzLMZLiTdE+SU4FGDi1H4MPFe
         8cfjIGdPo9uvQheVOA+/oUDBMKu4gcEhlvkzZr9p0Vy4LlEDs8cbDUKPsr4C5D5Hwj+t
         OxidHzNdgZnbsMlEj0GCUK0Rvb+6tGxzHh6dw0Lf829Yxtk687zCOdVOQW1Aogcg1FKu
         QtGt8Zt0tUlSOQBZMB1ctj8Uzz1bQDphIaI4K8bfaW6LIbGUpkgGo62t1tQf58OpktLQ
         73XcagisOFC29hOPsSMofM+ieEk+KN096XMrK6qf02n11iLoZMvq8UhgfsArQm7DTX7E
         1Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687971693; x=1690563693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3jAXCPA5P+oVcmiN1WqMULNs6BS64aNdqUj2F01rxk=;
        b=GS1WE9HM5W8DT4Jw1GByyzv537Kkna8NEe7IDFH1Fp4KvK7Pp+g3lRMGBMJR10mJwK
         yjAZV89eurljiDImSsu8WAfrASjBXVIezFs3BIJgc3tD7Q2hp1MYess0ij4Ljx6NvV8v
         GZaHnDae/zkPmvOjmzxOLrmiAi8amqA3rQhHZXTh4Ilgw1mYnzBX5Mk3eZ4rkLtTzodx
         xub2l4ykryOQwUxT/+0hFlbeY8g6LosyWLpNOBPApXaB+nswBRpcmc1z7ka0vai1RZxF
         7QCovpeDd0cMz4A5zZFIQsVPpK5olmPeiLDQM52smrztPwRi5fdWpWEKoA1YEn/Hrivk
         ygMg==
X-Gm-Message-State: AC+VfDwxvaivq65MBhc3HRi93LvyO9wjTd7NPZzmsaZW2sChcsbFsll7
	L6VFGFHhna9c4c7czoLc+xS4Hg==
X-Google-Smtp-Source: ACHHUZ5/ZB4gpxAhv68DRJt2A8rLz9ZAcJmpBjRmm4ynXXS4Mf9xvXKO9qyXiXbt2UU9LAJTW7ePVQ==
X-Received: by 2002:a2e:7007:0:b0:2b6:b8c2:a18a with SMTP id l7-20020a2e7007000000b002b6b8c2a18amr2503823ljc.37.1687971692931;
        Wed, 28 Jun 2023 10:01:32 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9254000000b002b1fc6e70a1sm328409ljg.21.2023.06.28.10.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 10:01:32 -0700 (PDT)
Message-ID: <86102be0-87ea-6130-6b9b-739dda279808@linaro.org>
Date: Wed, 28 Jun 2023 20:01:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL, v2] Add Audio topology firmware for Qualcomm SC8280XP
 X13s platform
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Brian Masney <bmasney@redhat.com>
References: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/06/2023 14:00, Srinivas Kandagatla wrote:
> The following changes since commit 
> ee91452dac5abfc4c5b9827cf55e701d8c0ca678:
> 
>    Makefile, copy-firmware: support xz/zstd compressed firmware 
> (2023-06-25 12:18:57 -0400)
> 
> are available in the Git repository at:
> 
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
> sc8280xp-audio-fw
> 
> for you to fetch changes up to f9a35b3f0779844aa686b76506344db70a72820d:
> 
>    qcom: Add Audio firmware for SC8280XP X13s (2023-06-28 11:52:02 +0100)
> 
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        qcom: Add Audio firmware for SC8280XP X13s
> 
>   LICENCE.linaro                                |  30 
> ++++++++++++++++++++++++++++++
>   WHENCE                                        |   8 ++++++++
>   qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin | Bin 0 -> 24296 bytes
>   3 files changed, 38 insertions(+)
>   create mode 100644 LICENCE.linaro
>   create mode 100644 qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin

I'm not sure if this is used for linux-firmware, but:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot for moving the file into a proper, device-specific location!

-- 
With best wishes
Dmitry

