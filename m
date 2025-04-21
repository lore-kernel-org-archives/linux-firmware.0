Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A7EC369AB
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Apr 2025 12:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC42DC4CEEE; Mon, 21 Apr 2025 12:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962A9C4CEEA
	for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745237558;
	bh=hRXG6FWLzdl32ApSXjftIcMGvaBm1M0z2KFRA0JEIoI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Q5eTSzg7EVzROBN1AZ8U0m1n/Lx/Z/8gP24KEh2Qtgo8VzT7QyXyj+h6xW/1mXC/B
	 5Zk94cS/dlCS0v3xbfG7g/lkA8Faq7EshzgFgR3dT2pZ7hJO5BvLa2WtUOMZVCK6ph
	 b5ZU3gQeNEO2KDcpvV9LNBbvGn/cTLequJuBbzHVF+HnUFe7smwrInav+HDDP0qFRT
	 QjIDhZRejwgZ+iBtEWJPGvAY+q7QvlPG+t2o8TRmBwUsHd+VWDwyXE+WnzzQuJZ2z1
	 DySLvhxwXkuXUKNEmUKPmc6HVBxGWp3GacrGbeRVgcwsUok1xt5ecJ/JKOsNvwSsNd
	 t/tAJZqDc/cPA==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e728841ed96so2548922276.3
        for <linux-firmware@kernel.org>; Mon, 21 Apr 2025 05:12:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy3R6rmHv+96dNISzqmBL727pNEttdrXO6glxOqz9rAkfGY5FV+
	jSgx8j3dcINzHHYAJtznAeSohKhSZZhT+uUFvfqAYdIyH9pn1jN2upISTg8kKUvZblSSrFpgCr/
	Xp3TjZyPjIaz5V+QVf0xA+W3UsQE=
X-Google-Smtp-Source: AGHT+IGa9/biHcnDb4i4EORWu+yhpav9u3xYApNy7B7i1LJMwxXZIqC0Q1RNJX9GqLnAeQWfWhJVu+01i3Srx6Cb04k=
X-Received: by 2002:a05:6902:4005:b0:e6d:df8b:4661 with SMTP id
 3f1490d57ef6-e7297eae878mr12792819276.33.1745237557773; Mon, 21 Apr 2025
 05:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <103648c2-c630-40fc-476e-4b68530baf37@quicinc.com>
In-Reply-To: <103648c2-c630-40fc-476e-4b68530baf37@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Apr 2025 08:12:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA51O1K=umYNhZ1zFSvSC_S724xe-TeociH+BvLV9juY5w@mail.gmail.com>
X-Gm-Features: ATxdqUF7QosZ3GL3YJ3BwDgUx02QjZPWjfr4cutiq05J1Ck09W8NJrAtsc_Oj_M
Message-ID: <CA+5PVA51O1K=umYNhZ1zFSvSC_S724xe-TeociH+BvLV9juY5w@mail.gmail.com>
Subject: Re: add hfi gen2 based video firmware binary for qcm6490
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 6:41=E2=80=AFAM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Hi,
>
> The following changes since commit 5aa42075d00c58da1596c22679879267d25057=
37:
>
>   Merge branch 'amd-staging' into 'main' (2025-04-19 18:16:40 +0000)
>
> are available in the Git repository at:
>
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video_fw_gen2_qcm6490

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/520

josh

>
> for you to fetch changes up to 51b35ac23ee7ca7ccea70afeb66840ee204ee185:
>
>   qcom: vpu: add video firmware binary for qcm6490 (2025-04-21 15:13:09 +=
0530)
>
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add video firmware binary for qcm6490
>
>  WHENCE                     |   4 ++++
>  qcom/vpu/vpu20_p1_gen2.mbn | Bin 0 -> 2036328 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu20_p1_gen2.mbn
