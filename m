Return-Path: <SRS0=d8Q7=GZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C0DC433DB
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Jan 2021 22:12:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D365623B17; Fri, 22 Jan 2021 22:11:59 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA7723B16
	for <linux-firmware@kernel.org>; Fri, 22 Jan 2021 22:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA7723B16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-lf1-f41.google.com with SMTP id p21so4556876lfu.11
        for <linux-firmware@kernel.org>; Fri, 22 Jan 2021 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jaCvuXTI5++yWrQ5zll4pAoJp7Kw8ngAgVV//NdLCO0=;
        b=Vy+MXcEDaveLQygfFzfes0pLrj0Xd5qsBfSLNxMclb3ohJj7BsLaNGLrPBq6Z2uDa0
         AhQerybNr7LQqyAnD3pMlfF/jeXuo2KjSnIxodI6cHALg4WWlmtnewnZsujZPTSDT3Hm
         vGhEpTJCHNxzUdDRHLcbUT0nI2nK2V/jY5yBE26g4woVsCLKoHI07XnWlLqLYtOuwqoD
         utZOxd0YDDAHqjMc2AI7BD3V4KMRgAfyzMxwMp0N9cpUrA9gQiAsuBtBiw3l6Q0bit3U
         uaRNY0ykMgTk9HOVhVVBbH1Frc4Pc3afpVuTNCoVEwmotJGqDc9C9lnZXmJrudeHZDdl
         JG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=jaCvuXTI5++yWrQ5zll4pAoJp7Kw8ngAgVV//NdLCO0=;
        b=ZzrTGnXEUnhOzwg8ErZLBkRv1nS87rMQWY9VcoGFso/n9KykcjbPNLFNz4KkcA8UGC
         fey6CMGwEAES3evHGr9k7Mm22sFvBK8ZZq7LLAp+HiTb2mdnU+7yo/ayonKCqPBYXIaw
         fBncTtjnlZo5yNBczx4TemAt1hKykmV+Sy5h5FJoJu78Cqxsf4uMyTju0vLisGmqma+H
         1YuZtMpZeTCbROkGKpLwvzQBzXlGma6XBNQJhK2XG9tCn17SiB0LNp07YA0YgPxT2XMc
         A49HbHRK1ax4rh5FqJD0qdEFzLcaJj671D6eH3OPJ95fCYpN2Fek6TKgsSmZJO3hAxki
         90ug==
X-Gm-Message-State: AOAM533Uop2pzLRW0B8EtieR/xeIvcO9lLl6O+aTDGeuZXWdrqe6Dknh
	iz401PeryUr6jEMgpQxODX6Ggg==
X-Google-Smtp-Source: ABdhPJy8eQHjcrzbrB3xmSPo6CMl85MirfidhUNAX/4Tpe/wgXdajjP1AaYv8WY5pPb8ly3lJ2yl+Q==
X-Received: by 2002:a05:6512:b12:: with SMTP id w18mr1019732lfu.323.1611353517820;
        Fri, 22 Jan 2021 14:11:57 -0800 (PST)
Received: from [192.168.1.211] ([188.162.64.145])
        by smtp.gmail.com with ESMTPSA id 6sm1070137ljq.69.2021.01.22.14.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 14:11:57 -0800 (PST)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: linux-firmware for Qualcomm SM8250 platforms
Message-ID: <b6580306-fbfb-e7ac-aa4e-2476a5ee39da@linaro.org>
Date: Sat, 23 Jan 2021 01:11:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello linux-firmware maintainers,

We'd like to submit firmware for Qualcomm SM8250-based platforms. 
Firmware successfully tested on Qualcomm Robotics RB5 platform.

The following changes since commit d5288624259300c558480c21a860fcf94187d29d:

   brcm: Add NVRAM for Vamrs 96boards Rock960 (2021-01-09 07:31:33 -0500)

are available in the Git repository at:

   https://github.com/lumag/linux-firmware qcom-rb5

for you to fetch changes up to df822a848cceb185d2d50a39140ba0c9cd9f33e9::

   qcom: Add venus firmware files for VPU-1.0 (2021-01-23 01:10:05 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (4):
       qcom: add firmware files for Adreno a650
       qcom: Add SM8250 Audio DSP firmware
       qcom: Add SM8250 Compute DSP firmware
       qcom: Add venus firmware files for VPU-1.0

  WHENCE                   |  26 ++++++++++++++++++++++++++
  qcom/a650_gmu.bin        | Bin 0 -> 41548 bytes
  qcom/a650_sqe.fw         | Bin 0 -> 31488 bytes
  qcom/sm8250/a650_zap.mbn | Bin 0 -> 13964 bytes
  qcom/sm8250/adsp.mbn     | Bin 0 -> 15515796 bytes
  qcom/sm8250/adspr.jsn    |  21 +++++++++++++++++++++
  qcom/sm8250/adspua.jsn   |  27 +++++++++++++++++++++++++++
  qcom/sm8250/cdsp.mbn     | Bin 0 -> 5822228 bytes
  qcom/sm8250/cdspr.jsn    |  21 +++++++++++++++++++++
  qcom/vpu-1.0/venus.b00   | Bin 0 -> 692 bytes
  qcom/vpu-1.0/venus.b01   | Bin 0 -> 7528 bytes
  qcom/vpu-1.0/venus.b02   | Bin 0 -> 300 bytes
  qcom/vpu-1.0/venus.b03   | Bin 0 -> 20 bytes
  qcom/vpu-1.0/venus.b04   | Bin 0 -> 20 bytes
  qcom/vpu-1.0/venus.b05   | Bin 0 -> 20 bytes
  qcom/vpu-1.0/venus.b06   | Bin 0 -> 20 bytes
  qcom/vpu-1.0/venus.b07   | Bin 0 -> 24 bytes
  qcom/vpu-1.0/venus.b08   | Bin 0 -> 16 bytes
  qcom/vpu-1.0/venus.b09   | Bin 0 -> 883152 bytes
  qcom/vpu-1.0/venus.b10   | Bin 0 -> 41360 bytes
  qcom/vpu-1.0/venus.b19   |   1 +
  qcom/vpu-1.0/venus.mbn   | Bin 0 -> 1973540 bytes
  qcom/vpu-1.0/venus.mdt   | Bin 0 -> 8220 bytes
  23 files changed, 96 insertions(+)
  create mode 100644 qcom/a650_gmu.bin
  create mode 100644 qcom/a650_sqe.fw
  create mode 100644 qcom/sm8250/a650_zap.mbn
  create mode 100644 qcom/sm8250/adsp.mbn
  create mode 100644 qcom/sm8250/adspr.jsn
  create mode 100644 qcom/sm8250/adspua.jsn
  create mode 100644 qcom/sm8250/cdsp.mbn
  create mode 100644 qcom/sm8250/cdspr.jsn
  create mode 100644 qcom/vpu-1.0/venus.b00
  create mode 100644 qcom/vpu-1.0/venus.b01
  create mode 100644 qcom/vpu-1.0/venus.b02
  create mode 100644 qcom/vpu-1.0/venus.b03
  create mode 100644 qcom/vpu-1.0/venus.b04
  create mode 100644 qcom/vpu-1.0/venus.b05
  create mode 100644 qcom/vpu-1.0/venus.b06
  create mode 100644 qcom/vpu-1.0/venus.b07
  create mode 100644 qcom/vpu-1.0/venus.b08
  create mode 100644 qcom/vpu-1.0/venus.b09
  create mode 100644 qcom/vpu-1.0/venus.b10
  create mode 100644 qcom/vpu-1.0/venus.b19
  create mode 100644 qcom/vpu-1.0/venus.mbn
  create mode 100644 qcom/vpu-1.0/venus.mdt



-- 
With best wishes
Dmitry
