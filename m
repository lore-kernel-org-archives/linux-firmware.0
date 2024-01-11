Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA848C47258
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jan 2024 13:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9ED7C43394; Thu, 11 Jan 2024 13:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A425FC43390
	for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704980980;
	bh=7ROrRTgEt9cqMtSoB99ZBN3yJk/6NW/ZJSI5OiGCEvA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UiozSyeB1bVXAqEtTe2sIakGXeE3iyrQl/LjK/oVX6JhikHdieqkSFeGouHNiW2ko
	 YBbc6jLRnfyPz4r6tMiGg0uKYl+hJ7ujc2dOcm6NgPAHep8bWYBD8HLsvXBXfrZYgC
	 Jb2I9rP4Egm1r0qF8n/eMxh+zpmfilxxRp++TnhppYhP3Xg8oiXYblv/tqvXV+1Dxi
	 PeD2VCvuEsjp/s9zg8cl9EY8qRRlev9yedqnSOAV4m5yvHx9XBeCyIeoTiIPae7r0i
	 w8UOsXGwE/YGwMuWlo/bxbIFWbCV0EiA5wrPxsfaUpsH8bk/e2vmCLemfRhCLNthki
	 BD9LM8K1N4hHA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5f68af028afso46649927b3.2
        for <linux-firmware@kernel.org>; Thu, 11 Jan 2024 05:49:40 -0800 (PST)
X-Gm-Message-State: AOJu0Yxh25kFee12S+ktFjsDQQScrfIcu58dqNo8JS+QywlimM6VpDSe
	9nldfGRJXfoe5MK6S2rsu2l6jH13aZJ2FMi5fdg=
X-Google-Smtp-Source: AGHT+IGdulykgr7QYTAd3vzef7c9OX/yd2G3fKP+G5vBHEhoi8F4LpZo1lFaQ8/m7/aO0uT+HppurhgnsP6UVp+bRZw=
X-Received: by 2002:a81:5706:0:b0:5e8:e0c7:f8d7 with SMTP id
 l6-20020a815706000000b005e8e0c7f8d7mr496479ywb.93.1704980979778; Thu, 11 Jan
 2024 05:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20240111114032.126035-1-quic_akhilpo@quicinc.com>
In-Reply-To: <20240111114032.126035-1-quic_akhilpo@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 11 Jan 2024 08:49:28 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6dWCZTk6x016xPb9KwojpzUMOU3gHO81CH6ToF4_Jcjw@mail.gmail.com>
Message-ID: <CA+5PVA6dWCZTk6x016xPb9KwojpzUMOU3gHO81CH6ToF4_Jcjw@mail.gmail.com>
Subject: Re: [PATCH] qcom: Update the firmware for Adreno a630 family of GPUs
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, robdclark@google.com, abathina@qti.qualcomm.com, 
	rajeshk@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/124

josh

On Thu, Jan 11, 2024 at 6:41=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> Update qcom/a630_sqe.fw to version v2.07.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  qcom/a630_sqe.fw | Bin 32304 -> 34188 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/qcom/a630_sqe.fw b/qcom/a630_sqe.fw
> index 907445d95866006b00f623394ac426a1527ddc4e..5f15fcdcf0b825189b3d7c4b2=
9b4e4d2ba68a9ce 100644
> GIT binary patch
> delta 6308
> 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
> Y!P^dA6wQaZOM!2|&=3Dk;#@qdN?3(pBKRR910
>
> delta 4194
> zcmZ`62~?ElapvFMpZ%9(cjedxfrSO+in1yS9^e8Zhsvc!)MuiiCK@%x#)H}jc=3DT-{
> zwlP!9YLFMpGp;Xbnz%{28jaC{g3%^Ej~bhJB+dB}i9R*z^XPngP|_y6H_Uu9^Ue3o
> z`ThG`tMtY_)C2#uTv>*}7C?O7yjkB9f}nCR_d5pM{K=3DCD?qXbp_!%9PRw**XJLiMs
> zT1R=3DREVX>g(nbeVu^rE=3D5Vz1~wFQ^Zo9dVP=3D%t!W=3D4{i9!wULX^CRZDPszQg4A&L=
^
> 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
> E046qMoB#j-
>
> --
> 2.43.0
>
