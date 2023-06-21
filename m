Return-Path: <SRS0=9GP6=CJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EDDEB64D7
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Jun 2023 14:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53EA0C433CB; Wed, 21 Jun 2023 14:17:19 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F3E6C433CA
	for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 14:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F3E6C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-57059626276so66072747b3.3
        for <linux-firmware@kernel.org>; Wed, 21 Jun 2023 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687357037; x=1689949037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+xYklj5PMyobjhXA/VwaGPhy9KcchXftQTErxK2SLto=;
        b=Y+sLE2CE7LA3Yqa8VXZaagqvjg43wDGdJvjZUFuAv2RxLSOuZXVfbkHl0ai5X+ZdwS
         dpo9ve84MPGB/CyNiJeS1QGFJjXYYB2qYmTite/cgjhrIuhfjq2JKovr+umi1LjFu+Hg
         3SGRwLsEvGWh53glzikHdPu8fRi28FM9VRe2udbPKqu7dmmk4PRQZdDVSGIgDpZmKsAX
         ijoJFm7stjl8kd0VRn5Kf2hnOiwz1xwcuEjJjYBJ1BRHWOYdnWaNUQeh4tvpl+rz/NfC
         trQmvm6Bh5xtzMoBjfRp04WlAcT2UXByZrSV9I7BOHkGOtn+bfWozmThAjYyj2QM8Jj1
         5U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357037; x=1689949037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xYklj5PMyobjhXA/VwaGPhy9KcchXftQTErxK2SLto=;
        b=lZOWcI9Kqg7mto/48DtOcutLA3KoJkut8KfeTUrKSRX+DwiLHXbiHrSLdxrRf+iJCQ
         uF/sO/NsPCY5ZyXfGmFLMi98EFqh8Qa57LblyEJkwXsW0DKn+7Am+6jcV/uhK6nqCH7b
         UjNgVk28AhpRioAqM4wTYIjmuJKDUQYGd62e1gQDVuzdL+dJDETbGGIufSBI6NC2OFSa
         HsrmgTxAV97Nw8SCIgpk/8GpB6BiNH1AO6thX27z9n6Jdid0/JzSw1W1TBsHzZV8/Wdj
         NabFAq8DQCSbiAqw7p6KmnimUNm6xJVAAS5CBIQgtE12DqN8xohMmIcpoUbdUD63x/13
         NnlA==
X-Gm-Message-State: AC+VfDxRgcXlI4dlztmXE/KA/J/WbFlXdu0AZDMWrU+29dOpv9PR3IN/
	LqjshPLDsviFSSoRgdF/NPT2V6Ak8KRh3iAJAUrjqA==
X-Google-Smtp-Source: ACHHUZ4+JSxviD45oXipN+JSDE2ZcZ/gtwyTm9modvwdd/BXFUfRHPaKIotRrEMNyfj1LNyc58BAWLuMiEErPALNN9s=
X-Received: by 2002:a25:bcd2:0:b0:bca:6694:23e6 with SMTP id
 l18-20020a25bcd2000000b00bca669423e6mr14132777ybm.16.1687357037246; Wed, 21
 Jun 2023 07:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
In-Reply-To: <9d59b054-76b9-9c8b-0be9-c614742c519b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Jun 2023 17:17:06 +0300
Message-ID: <CAA8EJpoXvL3rADU18AyEH_gPNXZH=odoUCVEnxgQ7vaxEYqvpw@mail.gmail.com>
Subject: Re: [PULL] Add Audio topology firmware for Qualcomm SC8280XP X13s platform
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jun 2023 at 13:55, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> The following changes since commit 045b2136a61968e7984caeae857a326150bfe851:
>
>    amdgpu: update DMCUB to v0.0.172.0 for various AMDGPU ASICs
> (2023-06-20 11:50:21 -0400)
>
> are available in the Git repository at:
>
>
> git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
> sc8280xp-audio-fw
>
> for you to fetch changes up to 85d1739e5aafcfada7a1e847c258217bd7408a5c:
>
>    qcom: Add Audio firmware for SC8280XP X13s (2023-06-21 11:11:34 +0100)
>
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        qcom: Add Audio firmware for SC8280XP X13s
>
>   LICENCE.linaro                              |  30
> ++++++++++++++++++++++++++++++
>   WHENCE                                      |   8 ++++++++
>   qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin | Bin 0 -> 24296 bytes

Could you please move it to the directory with the rest of X13s firmware?

-- 
With best wishes
Dmitry
