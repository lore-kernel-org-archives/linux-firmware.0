Return-Path: <SRS0=tCgH=CV=chromium.org=druth@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4AAF9B5F3
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2026 22:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 487B7C2BCB4; Wed, 22 Apr 2026 22:19:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A195BC19425
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 22:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A195BC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba3115fe0d5so1166077966b.1
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776896389; x=1777501189; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=iLt8ED5AsQPhkrILsJrygK9H6Por2AVPwJc76aNN7sYqVWYT6C9HxSIDQAH0/dXfH/
         PMpn2RDmKbyrBHilDH6Y+0Q2/lrI5AqmKByCdcP3avisRVXM4ZB3cD/ig/rV+NselvSF
         Unc7y7dFu7LkrR7iD1WY745DhpPexkwSmaRdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776896389; x=1777501189;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=CWfFcx9t5EqwgE4GMtlmkMaQgCbO+GaICpo8omooyiZS2KWzSxgP0HLKawLNMasVJC
         JiK3xeh5dbSRPDhTCiP0H2kLaF+1FrJoOSQrAcpsBcdlhVNJcpJ8PUc7CaJATvhHCllO
         CNlY4OmMB7qgnVXefgZTbC6lUvn6bKSeBbe3rxprfUxEp4iaaNKPyzmtqqjacrYRxysD
         kxx8MzpFU/g9flSH64b0JAZ5p18Sm+Be5251DgnaIX5iE49kP8RcEyrowFiMmG8VNWAm
         f0jY3QxFh3JI1hP7enGRvoozOVKjQ/e5kW+R+Vi4Q3IuWJv6CSSRLWKr5HEQhvLKo9r1
         4K+A==
X-Forwarded-Encrypted: i=1; AFNElJ9T25MlhqMM+3SB0lFL2gGfdW0eayAQ3t4y4pPrRZ2RiqgvMZrU99U10VJsx08KVMOPblHFU6/JRi+7yL3hkA==@kernel.org
X-Gm-Message-State: AOJu0Ywxl6b7T8RRfPU+hyOCJaehfVvhRZf9FL3dhrNk4XAD77XxCdzB
	MXNOpPn0/yfQ8PwlEcsUBK3tFwV16xbQRCn+z4MNwiEfaDT01dKTFmxxYJRa0Uv3ohXfiCH66ez
	2zuzFZJOLthM=
X-Gm-Gg: AeBDievWEdxZx8el9MVWpGUjZFnG78mBZ9TnHw9UIyZofkCXZQXv6x4BG1SZZ9P1pSZ
	mIusm8vfo7eWhg7eyepwJRKFROymWqPToEMVcKhEVSSOXYFxWhlL+5dyCnHOX7P2yhYIqOwkYB6
	reDxvx8hidNstoamL2cKNWChWV2l214uVVAVXG1FKEJvADGA1YEswIPs3SZyEhRi7fKIQyPW46Q
	O0ud7t8mtVmmBtaw1YHgjWTO7bUcwYRyE8972WHTE+Sm+/dsvvvyt1mQtwIyOvYZw5Peoa80bGH
	UGfe1zzW0lG2QoMVdfdLSJMmCVKWcGj3NMMeCz/ZkuAYdNgjlax1oe1hf6kWJ56HE4xjW9b36nw
	CPNIzAetJccZVemO/+VqNJp6bHA69AfVThgmdcdlbtmacPCjvtE9zVr2OvRmYvqdKBiTa5lfFIZ
	MQgD7llntdsx0xKeNsRsE9PYBgolqC+AaRTz56NvdrOp8eqTUNNvNh1vyRFeFuZp0EZNPe/ycQ3
	fWEY/Y=
X-Received: by 2002:a17:907:7241:b0:ba7:79ef:8694 with SMTP id a640c23a62f3a-ba779ef8ea0mr726710266b.14.1776896388868;
        Wed, 22 Apr 2026 15:19:48 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e31sm608873766b.12.2026.04.22.15.19.47
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 15:19:48 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so26472035e9.0
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 15:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8aTz8YTb5vItNgQR5qykDFnqkFyTGGzOfPPSUKlTyX8r7qGv9Bj69wtyOMQyGJASJzNwVsuZSRwqBIMtQIlQ==@kernel.org
X-Received: by 2002:a05:600c:1988:b0:489:1e5e:2cc with SMTP id
 5b1f17b1804b1-4891e6d485cmr202233445e9.9.1776896386155; Wed, 22 Apr 2026
 15:19:46 -0700 (PDT)
MIME-Version: 1.0
From: David Ruth <druth@chromium.org>
Date: Wed, 22 Apr 2026 18:19:08 -0400
X-Gmail-Original-Message-ID: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
X-Gm-Features: AQROBzBmd__SQ8rWjwodBKJTNSgO5yk1P_pxzbFRSNYWLXnIWe4Cen5zLFr9bzs
Message-ID: <CAKHmtrRD35fnE_TsZHzfgQ5p7=WHE1Fz8wnV0t2SGxDcgmopjQ@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: update firmware for MT7925 WiFi device
To: jb.tsai@mediatek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Leon Yen <Leon.Yen@mediatek.com>, ben@decadent.org.uk, 
	=?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>, 
	dwmw2@infradead.org, jwboyer@kernel.org, linux-firmware@kernel.org, 
	linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, litien.chang@mediatek.com, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Quan Zhou <quan.zhou@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Tested-by: David Ruth <druth@chromium.org>
