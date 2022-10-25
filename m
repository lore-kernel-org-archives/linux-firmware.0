Return-Path: <SRS0=ynyy=22=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777F9C38A2D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AC58C433B5; Tue, 25 Oct 2022 21:07:59 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99C6C433D7
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E99C6C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id p8so24557239lfu.11
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=aA1xEjEJIPmuIYgSOoA2oZmv/CG5JRPx4A5NrwoHE+D3jNXiIAtQ1YldhX3bOIYg1F
         XRxbkA5fEJltBdxOxQByPTjRq1MUNOU10vaTApQtVi+NQXnbRx7o5xBTnz7hv9ESBnJd
         C2Dk+0+wTC3/g8pnEE7d0O0QOTUk7qKFPHz+W06A5aTxmqku/szDouwtd/829b1CwqTO
         jkqVUFlK5O2QBKMD4zQBIGnoYa9DuC/G+5TCPu6Rl56tr/pSYc6NX1+zUmjDoOHxGyHO
         jUqGicElOGYYJKkMpqcf9FNuLiBVssUh8XXy815Hst1YKqCNYnNhqUWEHtqhIBWH+/3L
         FNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF+3wsg45xvLF5RBlwYMKr4aggC4R4uAm1oMiXFMvkk=;
        b=T8Mjil4d1lL2wu0vbhi1L7yXkz+6AbZyFtz1VTipieTszpc1MQq+RRCVY3CCL8GrAk
         5G4g/Zk1Kc7IpLD/wtJWMyms/v0eN7QRr+ymYkiz5jNvq9BrcFOk6aln1mULAOdEahn8
         tznmIswPiZasDFJAtWQMCkcvpBTT4ulpOx5qxufOAbiXloTn3jHkO6cctxFyGtAt3PQA
         0n1JhyF4dZVJgWl/KZaPL4l829VXLGJd5L7wIRYihctFs6eNmwJV6OZVfH24TyA/ryOD
         UjaGw9ZS9KDvPftB63hK5XarJ9at8AquQzVY9vfduPbjsRl50OEEafS8TLsrhgOunba2
         Dijg==
X-Gm-Message-State: ACrzQf3OhaG8pmJZJheeMEHvoULtLgXkwP8zGni3wsUTRcBvTdtBax28
	Ka/KHrbV5adtufgaINNzK9vafg==
X-Google-Smtp-Source: AMsMyM6RUdkt75CDjZoAv/huYgrSZ5MjCNQMY+vNa/uhYw0ikqwKbHLUrIVoKlTFzHLcqIC/yyidjw==
X-Received: by 2002:a05:6512:110c:b0:4a2:4119:f5c4 with SMTP id l12-20020a056512110c00b004a24119f5c4mr14140931lfg.606.1666732075976;
        Tue, 25 Oct 2022 14:07:55 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a05651203ac00b00497ad8e6d07sm570972lfp.222.2022.10.25.14.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 14:07:55 -0700 (PDT)
Message-ID: <13edc042-d206-187e-0a77-00e39525cb18@linaro.org>
Date: Wed, 26 Oct 2022 00:07:54 +0300
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

