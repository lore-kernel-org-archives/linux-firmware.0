Return-Path: <SRS0=CAxW=CQ=linaro.org=srinivas.kandagatla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9FEB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Jun 2023 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A09CBC433C8; Wed, 28 Jun 2023 11:00:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70674C433C9
	for <linux-firmware@kernel.org>; Wed, 28 Jun 2023 11:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70674C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fba8e2a9ecso16603465e9.3
        for <linux-firmware@kernel.org>; Wed, 28 Jun 2023 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687950022; x=1690542022;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulQFhef1Kx2adBzeAqktsDyeJX9bz1Y+UkfQ7ijM/Ag=;
        b=BoP0vafJwKzZcasx5SKCJw34caNCIeOpL5jdLknwLn7E4x0VWgpS6vKXUlrHvjsif2
         coeuyM30tuaMkCQxfM90fxJ/XhYKh4rBqXrjNrcDYPRe9E90SNmKHsbz8oNpIHvZpTyP
         5T2yfJpjHIU/KGF1tviS//HiU6sLj2JeQYyFwdycNNHJnyyO3ijEckwCLUm99ec1jxRI
         RoQqAZqmbH1CvDm0aG0tJuR42F0H250cYsFjfqLEn8sPX0tKNzWf43GGpUBkqMTD2ZJR
         ETQmSawJei6Z2XfwVGB1VO8ZwfP+JibnqmlTwlbwshBgrjBxlqn3voXEWx31cES4Rp9t
         4TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687950022; x=1690542022;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ulQFhef1Kx2adBzeAqktsDyeJX9bz1Y+UkfQ7ijM/Ag=;
        b=Den9QuUorudNw/kqhtRALDh6bzHyaXSlkMVBlwLTffhpYY7zQh/kiZDbTy3Vh0fvEQ
         WOINJ66isL6gTKj+3Q1zr/h/ELlpd5dDG3R0pLwhNJz6t1gXhseJNsoHAv16/dgJJHNu
         cr+rDCvnVEBVDlZdW23ASkVo4JNcJPrInc0UaGRjkvX9U5DLPjhk8ThjKT4VDbmUHSN9
         BTasOrT+s1KysIAo9LECBS9IFXY2bK4P4ZcUzRlCjFer8gaNuHR+cQ8dko5sMAmqY/zw
         xVy1LOIgVsOaHiAbOWkmZYRyr2+lsdBDKavlwceCY6VXdM4DP5tnz/J7SdwfqW05uezF
         T0Ow==
X-Gm-Message-State: AC+VfDycyNgTHtkuYdI764R5Ypa1LGCoqBvqrKOsOUzreHrv6+5L/LjZ
	Qc/0mROjGr1xRpQvTJnlm0wwZ4Z54MszUSRrXU3HZQ==
X-Google-Smtp-Source: ACHHUZ5zvTRF+s6HV6oYBlU9nNHd550kzS3uEH7WrQ3meppPmFsimAxioPm8/AxGco/5BQpWpU1Jkg==
X-Received: by 2002:a1c:7c04:0:b0:3fb:ac7b:4930 with SMTP id x4-20020a1c7c04000000b003fbac7b4930mr2125286wmc.3.1687950022162;
        Wed, 28 Jun 2023 04:00:22 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p4-20020a7bcc84000000b003f9c8c6bf53sm13454380wma.13.2023.06.28.04.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 04:00:21 -0700 (PDT)
Message-ID: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
Date: Wed, 28 Jun 2023 12:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Brian Masney <bmasney@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL, v2] Add Audio topology firmware for Qualcomm SC8280XP X13s
 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit ee91452dac5abfc4c5b9827cf55e701d8c0ca678:

   Makefile, copy-firmware: support xz/zstd compressed firmware 
(2023-06-25 12:18:57 -0400)

are available in the Git repository at:

 
git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw

for you to fetch changes up to f9a35b3f0779844aa686b76506344db70a72820d:

   qcom: Add Audio firmware for SC8280XP X13s (2023-06-28 11:52:02 +0100)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       qcom: Add Audio firmware for SC8280XP X13s

  LICENCE.linaro                                |  30 
++++++++++++++++++++++++++++++
  WHENCE                                        |   8 ++++++++
  qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin | Bin 0 -> 24296 bytes
  3 files changed, 38 insertions(+)
  create mode 100644 LICENCE.linaro
  create mode 100644 qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
