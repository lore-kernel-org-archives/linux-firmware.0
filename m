Return-Path: <SRS0=HDB/=JE=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E1C47DDF
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD785C433F1; Fri, 26 Jan 2024 13:35:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A131AC433B2
	for <linux-firmware@kernel.org>; Fri, 26 Jan 2024 13:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A131AC433B2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40ee894c5easo774225e9.1
        for <linux-firmware@kernel.org>; Fri, 26 Jan 2024 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706276123; x=1706880923; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9a5bBdyFVhJIwedix1U39wl9TOtCRTgVWMBfmVGZGQ=;
        b=JIFLpZr0KMks1Tia5ztKhbK4J+aBezISdeFUzp7Czv8VkHPWLdEC+KH4+RHlNY25D4
         jbuSoKzAT53VP4WrOw3XTKLGfptzhFuV1GW78xKkVXdjEwko7ng02TzdQvKFGkh4PIRA
         jCBD1+9Ppdzfb+/b4haWDVQqz+jW34/oklKhq5gbTU1cxaguAGisM7Y8bun2MO1jiuLi
         Po/07eMeJRwBMic4RoiIykWfkTPcfYKw2UDCXb54FfkAXEThbYIpUni2SeN/fUAp55RH
         nrotCiNfPuY9X1oaIj+lHapq+K/ZjLdnVUs1rf587rpZHePdG/B2J0Jeu+Nj93KRmYkN
         bOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276123; x=1706880923;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9a5bBdyFVhJIwedix1U39wl9TOtCRTgVWMBfmVGZGQ=;
        b=wCy2KbPzzRO2v5/zlZ+1ZcerdQeF1k6aNcGFYuz8Ng5zNj2NNI3/UW115A0BcCJA16
         KKZ553JurSm5O9l1XR0ttLkyvvHUPMvfis9+s3EQrMmCOvMPgcDnqKMShYGaD56DT8Pw
         BuTOSEi9bQE/ttSzXdi1nWsTU6QX7ZVxwKWfzpv671mFcFL+4w3mWoX0qeS+D3KlZ1rU
         CtfzAKXNnpzeVZ7QNh0l38HIkW660pM4miGsphfABpH5lWNBjPqEmPzMomAHgGIfJRSn
         tqsHaOFQTTt8w0ar7sisddeB6yliOoAOSBv4lOMXjl2VNpyIWotSzoA0pIdNvjXCPrsz
         RnZA==
X-Gm-Message-State: AOJu0Yx1wUMBgxxBcfgYGjOtKLWh6ZOIQB9s9DjZpVnozVbOEK4FQk95
	5i8rWg4/QNZbwEPtEAN389dv+DLZ502N3QhFm/fQjX+ZK+XVrt5Yf5S8gNp6uEhooo9ECcqpXrX
	bLOQ=
X-Google-Smtp-Source: AGHT+IGRHnqu89a3/XRm7EvLaRhopFG61nVUf1pw5Lt73M+Y/fLSzI+TrLXyYBqXjsjMEQbYXLHYow==
X-Received: by 2002:a05:600c:248:b0:40e:ab7f:3448 with SMTP id 8-20020a05600c024800b0040eab7f3448mr894814wmj.144.1706276122772;
        Fri, 26 Jan 2024 05:35:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b66c:951b:e9ef:af35? ([2a01:e0a:982:cbb0:b66c:951b:e9ef:af35])
        by smtp.gmail.com with ESMTPSA id fa6-20020a05600c518600b0040ee8765901sm147536wmb.43.2024.01.26.05.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:35:22 -0800 (PST)
Message-ID: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
Date: Fri, 26 Jan 2024 14:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Add Audio topology firmware for Qualcomm SM8650 MTP
 platform
Reply-To: neil.armstrong@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit 0c40df810685c15141413cee5bea7233e1db43fb:

   Merge branch 'consistent-file-spacing' into 'main' (2024-01-24 16:42:17 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8650-mtp-audio-fw

for you to fetch changes up to 85d372744a19cf78f7437c6027d7037baa0f0a52:

   qcom: Add Audio firmware for SM8650 MTP (2024-01-26 14:31:24 +0100)

----------------------------------------------------------------
Neil Armstrong (1):
       qcom: Add Audio firmware for SM8650 MTP

  WHENCE                          |   1 +
  qcom/sm8650/SM8650-MTP-tplg.bin | Bin 0 -> 24296 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/sm8650/SM8650-MTP-tplg.bin
