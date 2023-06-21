Return-Path: <SRS0=sTRQ=CJ=linaro.org=srinivas.kandagatla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E3EB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Jun 2023 10:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC334C433C8; Wed, 21 Jun 2023 10:53:48 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFF2EC433C9
	for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 10:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFF2EC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3112902f785so3839456f8f.0
        for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 03:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687344825; x=1689936825;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOMxS6RwW/d7vuc376qdNyNpcZALKC5US0Joy/lb4Sk=;
        b=BIB0WuymJSIzGVgKi94ef2avt9bYjmZ98fSCc1ddHA5zQqD9VuDJWr4SQ1LumrM6Fn
         Rr+1eSa9Bd8Bds4PC+TrJ2eGLr7h37YR+0KsRINIanWhYToMYhtIsgryDt/aE9xc4JPu
         HIqkzWcbckNbxWbAci1fmuxI96ADTnu1bBslc5/GlD3a4YZfo+h4BfUgDJSTaDFEYt3u
         g1S3LnvrmwwpPfXp5V+LxSBdlraqxdU7zE+lWqBmqkq82sbWxD1v+0Q84WrMQhzwNh0c
         2CDrTkRFWlpM2HJqh1Z5Dz4cJSnxBDPWXaTTrD+agdWsrAJuoOobvmwiqjGmvI9FgOeL
         JD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687344825; x=1689936825;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOMxS6RwW/d7vuc376qdNyNpcZALKC5US0Joy/lb4Sk=;
        b=isT7IXFkl/5Vjht2KVye6gl3yq2Wj5tzuiCA+IY23sJ72LGwuegeiUKqtwWp9++YvW
         WcTbuIVPrkmj3YHQwDU03eLS0/qHKBNL0sVSw/ulrhT5W54n24TJxRJM5O4NLvFHI8hO
         Sd88FrFHABEgJTrd6nvM6nUWO5rWZ7Y6cihbOKD+590QZ/Mvve9qeGgEluuWHQca3EYG
         neo/dD2wqIUdb39EAbXtbP4jaj5Kcs3R8MFHSVRk2V/MitjnNhlFpE+7DBYjhpuxzMk5
         qb03imCzFM1nhLgpkerbyWYe7YztZ7KXmRZ6XJP/r41SARAmr7AVtPbUipS5ZeozjWED
         3mmg==
X-Gm-Message-State: AC+VfDy5Qgdkd9u4oBehTTAn/D3+9nGsKBVBFhGNiobwN1b0TJ1f1M7w
	ak5045H2Hb84ynBxt6i4QiBlJzo0Nvqbq6SazDcuKA==
X-Google-Smtp-Source: ACHHUZ5nP+fsVKuJeYKtwV5Koaj5ir+sdR2QXsugFWiOQJ+vHmJ5+Wjz9jHku3W9EJi3H3b/5lg0+A==
X-Received: by 2002:a05:6000:196f:b0:30f:bdad:19db with SMTP id da15-20020a056000196f00b0030fbdad19dbmr19604346wrb.10.1687344825393;
        Wed, 21 Jun 2023 03:53:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p1-20020adfcc81000000b0030ada01ca78sm4179124wrj.10.2023.06.21.03.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 03:53:44 -0700 (PDT)
Message-ID: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
Date: Wed, 21 Jun 2023 11:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Brian Masney <bmasney@redhat.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PULL] Add Audio topology firmware for Qualcomm SC8280XP X13s
 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit 045b2136a61968e7984caeae857a326150bfe851:

   amdgpu: update DMCUB to v0.0.172.0 for various AMDGPU ASICs 
(2023-06-20 11:50:21 -0400)

are available in the Git repository at:

 
git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw

for you to fetch changes up to 85d1739e5aafcfada7a1e847c258217bd7408a5c:

   qcom: Add Audio firmware for SC8280XP X13s (2023-06-21 11:11:34 +0100)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       qcom: Add Audio firmware for SC8280XP X13s

  LICENCE.linaro                              |  30 
++++++++++++++++++++++++++++++
  WHENCE                                      |   8 ++++++++
  qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin | Bin 0 -> 24296 bytes
  3 files changed, 38 insertions(+)
  create mode 100644 LICENCE.linaro
  create mode 100644 qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin
