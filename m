Return-Path: <SRS0=FiGP=I6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DC4C433ED
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Apr 2021 20:11:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 22151610CF; Thu,  1 Apr 2021 20:11:18 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B58610CB
	for <linux-firmware@kernel.org>; Thu,  1 Apr 2021 20:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B58610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=dmitry.baryshkov@linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 15so3589377ljj.0
        for <linux-firmware@kernel.org>; Thu, 01 Apr 2021 13:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
        b=S9jguAXDEbC9AQ4Fh8k0nFBU4XeGYh3uwL/9uoFDllELILiT+Yl0sQ3m8R9TCU8Ve9
         7tUyMZX3ScnYgmyYTtKhSkpHQWRfNTglbiVu4l1Cfn8VWlOCFTtpRTibwAlW80EUWVUr
         zLRQ7X/2H1Dz/LylTy624HG0BPyYp3J5d4jH75ay7aUY+KhCgqbWbXBzViUb5Tt3RmTM
         za5Gg2H1jPHN/jTIXOCQeUenMLvJFAXaE0BtbsIztzX88O2uZJstQm9GThxh9y37dM5a
         C5++qUEmBualHNLppes+DbOAmtYC5hb6P+kEIjj9cx4oS5QJByp/ArIOMcA5391dVe94
         ACSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mhUDqpSrPGJrUC3y7pqQdiWyabW803L1a+YQHPLvBho=;
        b=W6klcCKMEOnqoif5sY+qUOx+BGSfm0+JRxtu8N3QAcGRhHDD+Eite6m0lZs//sXd7W
         nBXK8fv2TsZxQK9CwbH58WtcnNhuKXm8b2NbdO6FoFwx5WoB05vSfgk7X6LoxLngDhx3
         tNaGgGhmUxKaAskQWxtwtqDFijqCVLE2iZILRoDCJN3+rhYC0k14GQFSmTNlLgMf/QXK
         /j75sYS4XVRheDldNh46XHzqseTIecbJnZYCQNdODY+PqYRrNvcCqQV10M/kU02qeCzO
         rpCYh+4hAP07q4Gao3CumTWGlcj8FzKkLqRfA216LotnnvoUSBeLgTqBAJBPhoXPPSWn
         mBSA==
X-Gm-Message-State: AOAM533M+U+qA0t/9kS+/VcDfWaa5AAQp93JYdbKZfYHsSXzcy7kv2fR
	yQiY81qNmKIe3Tb2rc/R1/FBqA==
X-Google-Smtp-Source: ABdhPJymsHAJUmUiaWVJ2EFdl8kRUFWJKEn+2UlrxStbtaESaHjtQkjEINDn/Wa/DuGHApcP1BxGxg==
X-Received: by 2002:a2e:981a:: with SMTP id a26mr6388275ljj.204.1617307876092;
        Thu, 01 Apr 2021 13:11:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w23sm711421lji.127.2021.04.01.13.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 13:11:15 -0700 (PDT)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Update firmware for Qualcomm SM8250 platform
Message-ID: <63f0c675-d04b-1961-53cd-e621b48dab94@linaro.org>
Date: Thu, 1 Apr 2021 23:11:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello linux-firmware maintainers,

Could you please pull updated firmware for Qualcomm SM8250-based 
platforms. Firmware successfully tested on Qualcomm Robotics RB5 platform.


The following changes since commit 3f026a2f13a8f130cde849168a111ec80f12e27b:

   rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x59A_76A3 (2021-03-22 
10:17:18 -0400)

are available in the Git repository at:

   https://github.com/lumag/linux-firmware sm8250-new-fw

for you to fetch changes up to d8fa0cfb4a285d11fd7102efd1763f1be90fac99:

   qcom: sm8250: update remoteproc firmware (2021-04-01 23:05:00 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
       qcom: update a650 firmware files
       qcom: sm8250: update remoteproc firmware

  WHENCE                   |   2 +-
  qcom/a650_sqe.fw         | Bin 31488 -> 31804 bytes
  qcom/sm8250/a650_zap.mbn | Bin 13964 -> 13964 bytes
  qcom/sm8250/adsp.mbn     | Bin 15515796 -> 15515796 bytes
  qcom/sm8250/cdsp.mbn     | Bin 5822228 -> 5822228 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)



-- 
With best wishes
Dmitry
