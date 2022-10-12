Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D08C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 17:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65553C4347C; Wed, 12 Oct 2022 17:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E238C433D7;
	Wed, 12 Oct 2022 17:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665594496;
	bh=82JcEb/mOeuKvVFFth9N70IVoiMKS9+VBMUfpKHOQLA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=lOecsqDL5n5X+lEjCdAKBo32UwPxMsnl83JMhv4k3km1Y/oUswtVWwbW1lbnvm5Yz
	 AwBasXlOX/fys+MuiL8Jm51u9KZ8xRSkB78ePqVnXpgerqUb1MJswO8zpRm93z2iie
	 YR9K25aIbY0OlO84Nx7ptJ2pMjwWFFd/EzlGHirW8SLqAXygxdYJHNZAwb1MWX2S0B
	 xwTOREnB4LgTY3sbuHxsV/QVt8VGJPXBhijmolmg2EaZt5BCOxSOunQ9TxaKcSX7wn
	 UP7vWQ24Jlcy9dCiLR77els08wegRpp5/BfkGhOncD1vHYM6OrjSF4NpXFtjuhcE/L
	 hskfojXkcn/ng==
Received: by mail-oo1-f53.google.com with SMTP id r15-20020a4abf0f000000b004761c7e6be1so12553203oop.9;
        Wed, 12 Oct 2022 10:08:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf2wgDNa/yitUg2CgNe4axNeiddEA7jQzlrirXbNKak4Ovg0ArED
	Gk4prwO2QexbfLkUp5nja/RAlwqFtEWeqKasxWY=
X-Google-Smtp-Source: AMsMyM4qk3w6rDeoYnzq8IA9dBvLHotj7W1REdKbRhOxqltx7Z5SMfXisJDPj16EUmt0svsaHcXPJM4x3EEm+vAlssU=
X-Received: by 2002:a05:6830:44aa:b0:661:955d:c346 with SMTP id
 r42-20020a05683044aa00b00661955dc346mr8018042otv.160.1665594495432; Wed, 12
 Oct 2022 10:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:08:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7OHtAm9YBrWcgSrqn3U__QvdyxRFx1P2EFjAdnC_qmWA@mail.gmail.com>
Message-ID: <CA+5PVA7OHtAm9YBrWcgSrqn3U__QvdyxRFx1P2EFjAdnC_qmWA@mail.gmail.com>
Subject: Re: [PULL] qcom: add squashed version of a530 zap shader
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 6:45 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:
>
>   linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware a530-mbn
>
> for you to fetch changes up to 44fa25ddf7d803f347dcdb0ecc52f72268979b92:
>
>   qcom: add squashed version of a530 zap shader (2022-10-11 01:31:10 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qcom: add squashed version of a530 zap shader

Pulled and pushed out.  Thank you.

josh

>
>  WHENCE                    |   1 +
>  qcom/apq8096/a530_zap.mbn | Bin 0 -> 17188 bytes
>  2 files changed, 1 insertion(+)
>  create mode 100644 qcom/apq8096/a530_zap.mbn
