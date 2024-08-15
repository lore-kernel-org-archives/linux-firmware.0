Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BEC3DA7F
	for <linux-firmware@archiver.kernel.org>; Thu, 15 Aug 2024 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A237CC4AF0A; Thu, 15 Aug 2024 13:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C99DC32786
	for <linux-firmware@kernel.org>; Thu, 15 Aug 2024 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723729181;
	bh=dwvIh9N9Zw/Tx1jlmRi2uB/z/MShlSI6qvNOch+1w3M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SgWSBUt7dwtK8VmxLHHzm9Myy1j1VcUZYdz9oItgMYJVXIpZIveLH58P6cwPcw4QS
	 ERzIFA6/sexUkgBGsB6nBjWVwlZ2wgEPIjzto+Hw8EbAfsWVgfNoLmm4NIB8hDN8sS
	 G63k1r4rSaszfDHsR0i/PA+BHu3UC9uGCYVGKI5XpC4+tgoz3z2tS3MZArX8/Wm6fl
	 F17CQGSI3+2SpAfYngqDjIPGAE0AZQwCadkFxlVqx54bLx30Er5MDZwgNNpPh1xaDv
	 9MNd7hWjqWDvS1KcEYQlGnHYZUbl2LfBeIBn7nWYsOmasvuPQWKp0ZbciQvRB4gTJ9
	 nbYCnzye7ED3A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6510c0c8e29so9908687b3.0
        for <linux-firmware@kernel.org>; Thu, 15 Aug 2024 06:39:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YzRVOSxRsacmsMWZT8+d8dsLl0pqvR/LGVFGoQhl6qvo14BkS5H
	WHcUqw02ibEZS7MoSPbDIadPMBjTp26k0tfupMDBpSAIspHLsk/fPeTGjg0RuD9QWetbOeF69+A
	qdZmZzaFGpxkYWx5iDURGvV/Kw3E=
X-Google-Smtp-Source: AGHT+IEIVl02ayrdonCcxxZdR69ut5Nf095s9kWDva6cL6MKZY6+ZM2zlSkI1T6ghXoV417lZOHf2Uj75/QQlZYDt+k=
X-Received: by 2002:a05:690c:83:b0:62a:2a7d:b512 with SMTP id
 00721157ae682-6ac96f89e39mr78234957b3.10.1723729180822; Thu, 15 Aug 2024
 06:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <876a7bad-70ac-8daf-671f-80bf84bdaef3@quicinc.com>
In-Reply-To: <876a7bad-70ac-8daf-671f-80bf84bdaef3@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 Aug 2024 09:39:29 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7JhhKRRuQDoiKWLd90=An2sw0OmiB0sWEx860QFtuBaQ@mail.gmail.com>
Message-ID: <CA+5PVA7JhhKRRuQDoiKWLd90=An2sw0OmiB0sWEx860QFtuBaQ@mail.gmail.com>
Subject: Re: add video firmware for sa8775p
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 2:10=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hello,
>
> The following changes since commit 594600762910b4bbe8a88d0dc6495521366c88=
0c:
>
>   Merge branch 'vpu' into 'main' (2024-08-09 13:02:09 +0000)
>
> are available in the git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SA8775p

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/274

josh

>
> for you to fetch changes up to a55d7a750828688e2c215e01bdf22a2516f9cd4a:
>
>   qcom: vpu: add video firmware for sa8775p (2024-08-13 11:28:02 +0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add video firmware for sa8775p
>
>  WHENCE                   |   4 ++++
>  qcom/vpu/vpu30_p4_s6.mbn | Bin 0 -> 2300692 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu30_p4_s6.mbn
>
> Thanks,
> Dikshita
