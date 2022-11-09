Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E6C4332F
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Nov 2022 17:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4066CC43470; Wed,  9 Nov 2022 17:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276DFC433B5;
	Wed,  9 Nov 2022 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668015722;
	bh=IrrEShoFZx1/kOf9tyjTRp/MFWmjc59nvaUjLiV1jb8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EDziQ30rwdDcsYWZgIpz0AXI+XK5vr1yqzo+MQ+5GdDRt41w+g8l2T/VZ2E5et+rS
	 0vU7Ma8DbaNqIs1ynrGhUBZ1zKh8c/Tq59ue0hMJDiVGQWRzzMYqcgEnHNyWpfFtX1
	 d+cm7j3UjahiAzuTDQ5r6fu53kmm5TgAmKseUhuQ5Lqf7FHW8GF/XbbEy1ApMuhHXm
	 r9ToHXp+S+NEbw/8SWh87kv7SloVQ0OSFzjWX6xbGxeTTsJvc0GI6zgzc1deCBlXf0
	 F9jGiWrGyvAKCxrFMuy8cjImU3Ola28uPUcFDQn5sbBb4A+/A+oBgJac/ggg7MlmnJ
	 xzpiNGhLb8B6Q==
Received: by mail-ot1-f45.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so10517512otl.3;
        Wed, 09 Nov 2022 09:42:02 -0800 (PST)
X-Gm-Message-State: ACrzQf2/edpU6GTlQV1ldEJuZiOEGxLtSIhUg0i6BwQgpQutPLnSDptY
	LWGgxSAqppEsKNRZjXh4X+oIje+/NhLlM2C0C0c=
X-Google-Smtp-Source: AMsMyM4I4k15nJ/AxlESXxW+oGY2oqPZBCXYcaY0sIgqJWOvljStGOCS+lKLxWdAhDiqyIPiJH2peVnVMTPP6Ha90wM=
X-Received: by 2002:a05:6830:6089:b0:660:ea3e:46b7 with SMTP id
 by9-20020a056830608900b00660ea3e46b7mr30167370otb.166.1668015721265; Wed, 09
 Nov 2022 09:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20221031183930.103623-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221031183930.103623-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Nov 2022 12:41:50 -0500
X-Gmail-Original-Message-ID: <CA+5PVA66L63d5z=D5WTi=+tSDrEWiZhBUG=FtAQZXSt7uSDmNg@mail.gmail.com>
Message-ID: <CA+5PVA66L63d5z=D5WTi=+tSDrEWiZhBUG=FtAQZXSt7uSDmNg@mail.gmail.com>
Subject: Re: [PULL] qcom: drop split a530_zap file in favour of a530_zap.mbn
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022 at 2:39 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Follow the example of recent qcom/venus changes. Drop the split
> qcom/a530_zap.bNN files. Replace the qcom/a530_zap.mdt with the symlink to
> qcom/apq8096/a530_zap.mbn.
>
> The following changes since commit 8bb75626e9dd831d323c4e460414b56260f0b700:
>
>   Merge branch 'for-upstream' of https://github.com/CirrusLogic/linux-firmware (2022-10-31 11:12:54 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware a530-mbn
>
> for you to fetch changes up to 7d2bb50ced53767875f30f94cebdbd17b1346b9b:
>
>   qcom: drop split a530_zap firmware file (2022-10-31 21:33:47 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       qcom: drop split a530_zap firmware file

Pulled and pushed out.

josh

>
>  WHENCE            |   5 +----
>  qcom/a530_zap.b00 | Bin 148 -> 0 bytes
>  qcom/a530_zap.b01 | Bin 6536 -> 0 bytes
>  qcom/a530_zap.b02 | Bin 4900 -> 0 bytes
>  qcom/a530_zap.mdt | Bin 6684 -> 0 bytes
>  5 files changed, 1 insertion(+), 4 deletions(-)
>  delete mode 100644 qcom/a530_zap.b00
>  delete mode 100644 qcom/a530_zap.b01
>  delete mode 100644 qcom/a530_zap.b02
>  delete mode 100644 qcom/a530_zap.mdt
