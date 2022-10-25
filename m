Return-Path: <SRS0=ynyy=22=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44421FA373E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C2F7C433C1; Tue, 25 Oct 2022 21:08:09 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0934EC433D6
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0934EC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id g7so24603716lfv.5
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=U5bMN+oaA9QRE6q8CJP7lUahd44tKbmmh0qld/oprQaKLiQF0r1lahdNIhbcgyz9w1
         FI9gueD+8vwzUdKYIvi/y4H4A3gqsUMI0Jwz3UhLQ/0qbc9rMhSznbIEYeyHzuYAt9lD
         acR4rFfFU/wdXPQIAozr5KoMLaZmzFDsfw1eIf1yda2QaAOLI9SoZcQot4m3irC8EmAK
         WVFJBEqwzX9+RphGwN/QKr9pwnUL9/5YWfVSIRS7xkouvwPsgLV89vG74U5Oy/OPtcPn
         X71v9SOymDfFKa3NPIbmqTddyYJK5X1XacYJVNQwublLvedXGuOMcmmOk6LvH1OlwFWP
         pQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=dPT8uh3l9c+dK0BTIYGG5DSxnAbEqf6RPuLFOrDj4/WAORgB3g5DUGCR98s+RRBBe7
         dCsgpZxIZ6hiXfJ5OfZWAa9BxB2l3iY/1zkDdu4VzIMo8SPz9Eb/Yx7ISAgbziKUYYCD
         bVpCwvuVjSISvquYB28tIJfn0ZHLwoZWPcIO1qpflaHt7lHVtFiw54y7bPEBWsF8UJ3r
         b18KW0tt6Y2GLBRfoPuDgmLNQbsNJpn5a3zc5xQE9GjcqcUY2MZqxZ9AbhCVyiNWYmMl
         A2M+Ewa5fST2R1PWQ2Qn2UjlgR6lz0zyQD3cC5qg5dvzEyeHUy9NfxqTq0xvYfHeueFZ
         l7YQ==
X-Gm-Message-State: ACrzQf0QzQ8Jfap7bSCVF8uIw5MiHclsK0yJNOdbfuZHaDusmAmzy0nt
	3e2B4wbDOFw7bUmNs/4vPRU6DQ==
X-Google-Smtp-Source: AMsMyM4unZplmpBcci34j6spLBCFpxfWsmqoM/wQi1xA0mtzeb5UBgiNLmQ7Q0g6uA1AFLjK7B8emg==
X-Received: by 2002:a05:6512:22c3:b0:4a2:7cd9:1f1f with SMTP id g3-20020a05651222c300b004a27cd91f1fmr14199093lfu.582.1666732086156;
        Tue, 25 Oct 2022 14:08:06 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id e18-20020a05651236d200b004946bb30469sm578112lfs.82.2022.10.25.14.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:08:05 -0700 (PDT)
Message-ID: <149c9604-03ad-3869-075c-7080d921deb6@linaro.org>
Date: Wed, 26 Oct 2022 00:08:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PULL V3]: qcom: SC7180 and SC7280 venus firmware updates
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: Nathan Hebert <nhebert@chromium.org>, linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Vikash Garodia <vgarodia@qti.qualcomm.com>
References: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2022 23:54, Nathan Hebert wrote:
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> 
>    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmware_v3
> 
> for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe0389131:
> 
>    qcom: update venus firmware files for VPU-2.0 (2022-10-25 13:34:43 -0700)
> 
> ----------------------------------------------------------------
> Nathan Hebert (4):
>        qcom: replace split SC7180 venus firmware images with symlink
>        qcom: update venus firmware file for v5.4
>        qcom: remove split SC7280 venus firmware images
>        qcom: update venus firmware files for VPU-2.0
> 
>   WHENCE                   |  24 +++---------------------
>   qcom/venus-5.4/venus.b00 | Bin 212 -> 0 bytes
>   qcom/venus-5.4/venus.b01 | Bin 6808 -> 0 bytes
>   qcom/venus-5.4/venus.b02 | Bin 873596 -> 0 bytes
>   qcom/venus-5.4/venus.b03 | Bin 33792 -> 0 bytes
>   qcom/venus-5.4/venus.b04 |   1 -
>   qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
>   qcom/venus-5.4/venus.mdt | Bin 7020 -> 9 bytes
>   qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
>   qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
>   qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
>   qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
>   qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
>   qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
>   qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
>   qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
>   qcom/vpu-2.0/venus.b19   |   1 -
>   qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
>   qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
>   22 files changed, 3 insertions(+), 23 deletions(-)
>   delete mode 100644 qcom/venus-5.4/venus.b00
>   delete mode 100644 qcom/venus-5.4/venus.b01
>   delete mode 100644 qcom/venus-5.4/venus.b02
>   delete mode 100644 qcom/venus-5.4/venus.b03
>   delete mode 100644 qcom/venus-5.4/venus.b04
>   mode change 100644 => 120000 qcom/venus-5.4/venus.mdt

I think it's more typical to use Link: statement in the WHENCE file 
rather than a symlink itself. `find -type l' returns a single file: the 
newly created venus.mdt link.


>   delete mode 100644 qcom/vpu-2.0/venus.b00
>   delete mode 100644 qcom/vpu-2.0/venus.b01
>   delete mode 100644 qcom/vpu-2.0/venus.b02
>   delete mode 100644 qcom/vpu-2.0/venus.b03
>   delete mode 100644 qcom/vpu-2.0/venus.b04
>   delete mode 100644 qcom/vpu-2.0/venus.b05
>   delete mode 100644 qcom/vpu-2.0/venus.b06
>   delete mode 100644 qcom/vpu-2.0/venus.b07
>   delete mode 100644 qcom/vpu-2.0/venus.b08
>   delete mode 100644 qcom/vpu-2.0/venus.b09
>   delete mode 100644 qcom/vpu-2.0/venus.b10
>   delete mode 100644 qcom/vpu-2.0/venus.b19
>   delete mode 100644 qcom/vpu-2.0/venus.mdt

-- 
With best wishes
Dmitry

