Return-Path: <SRS0=LusK=75=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49893C76196
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Apr 2023 11:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30C14C4339B; Thu,  6 Apr 2023 11:31:11 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A80BC433D2
	for <linux-firmware@kernel.org>; Thu,  6 Apr 2023 11:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A80BC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54bfce685c1so64596017b3.1
        for <linux-firmware@kernel.org>; Thu, 06 Apr 2023 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680780669; x=1683372669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLzykTqVWm3t/NDeaXdniWtVLPRXwLG7qAY5Ysw+X84=;
        b=Y5omSK9/mcLP6rF/H56vc1v3JxCze5CA1xgSdkKNYx8TrENP7H8M0faukE0CZsL6ya
         JNZ9mIvA/c9PA/EE4c0hxLhh5sjPnGC9ytx72UxoprYMQlaHOsZN46BJ7We40yu+HbWy
         kimBlSezI8bxH3QBHL5gs0UTRQeA7QefbxtcXpecIA/yyK4yX39NYA+yliuHpZBZdGDh
         RmNsTHVJqhxfhQAVs5Jx7xhOJFGF1A7xYeC8dc/c0deZF28FWQ7EMv4rEfLAJj0Ok33b
         0Vx4fjqE7in8s/cine+X7K4eR3NDF+lwjJCj/TflEb8of7FNZtsq0bpG6mU+rtAXdMwv
         R2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680780669; x=1683372669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLzykTqVWm3t/NDeaXdniWtVLPRXwLG7qAY5Ysw+X84=;
        b=hBfgP4o28I+iGbvvzdJmLVigqwyIyxOodXW5tZwqh081+/ptT1+I4n6JEuy0WJ5HXH
         X+uEPbIP8RyLbI+ydBdQWVuiCptiQFMuFcQrFpUR1VbTCGzoIL6rLxqwZvgKCZukLhg4
         7GMAjXTspnNrKUykSAV/u3j8HrX5rwheigEDOWB/sMqtbum5mnyenV3qTf+GGs41pRYI
         S3Yo8AqF9JCD3mExQ7g0TXN1VmAW84dvFLsP4lx6ORw6z4by2PsRygwCQK83r06R3Eq3
         am9hckSQXbLeGP6eZiZofuLJmAbFfMKRmM8kbXrlkS6XB/JQy7nVlTYGLVx2mxHsEIDK
         78yQ==
X-Gm-Message-State: AAQBX9e4e4htDD4+eEesl4uSe57DIOSvJrxEstcmJTL6SnREeeAinhQX
	Rq/WQp4edX9d6qcx/Ij6QMp28rWEHAvqeXUWbwo=
X-Google-Smtp-Source: AKy350b3MPlmGiczMi5HswyhYFnKFNXoSXqewOV9CqZXexTaxWolbFtzZ06CpOt4w0zhRfZi8uL0a/xM8tn+4qTST4o=
X-Received: by 2002:a81:af14:0:b0:545:621b:5076 with SMTP id
 n20-20020a81af14000000b00545621b5076mr5559084ywh.2.1680780668879; Thu, 06 Apr
 2023 04:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <72e35b08661be39a97b12896c26496874418950d.camel@realtek.com>
In-Reply-To: <72e35b08661be39a97b12896c26496874418950d.camel@realtek.com>
From: Josh Boyer <jwboyer@gmail.com>
Date: Thu, 6 Apr 2023 07:30:58 -0400
Message-ID: <CA+5PVA4SOinJXJRrgXszbOqd5yjhgKqqt0AENyXy0Uae2hm35w@mail.gmail.com>
Subject: Re: pull request: rtw89: update firmware of 8852b and 8852c
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Timlee <timlee@realtek.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 3:42=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.com> wr=
ote:
>
> Hi,
>
> Update two firmware of rtw89 driver -- 8852b v0.29.29.1 and 8852c v0.27.5=
6.13.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 2e92a49f90f73c8edc44b25c6e669d5e70893c=
90:
>
>   nvidia: update Tu10x and Tu11x signed firmware to support newer Turing =
HW (2023-04-04 08:03:53
> -0400)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git HEAD

Pulled and pushed out.

josh

>
> for you to fetch changes up to 9f7502f1dbb16aea2122004dd607e03ca6a62c0b:
>
>   rtw89: 8852b: update format-1 fw to v0.29.29.1 (2023-04-06 15:32:12 +08=
00)
>
> ----------------------------------------------------------------
> Chin-Yen Lee (1):
>       rtw89: 8852c: update fw to v0.27.56.13
>
> Ping-Ke Shih (1):
>       rtw89: 8852b: update format-1 fw to v0.29.29.1
>
>  rtw89/rtw8852b_fw-1.bin | Bin 1188488 -> 1184992 bytes
>  rtw89/rtw8852c_fw.bin   | Bin 1532656 -> 1532736 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
