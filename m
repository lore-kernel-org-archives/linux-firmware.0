Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791CCAC581
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Sep 2025 14:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90F5AC4CEFA; Mon,  8 Sep 2025 14:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAF2C4CEF1
	for <linux-firmware@kernel.org>; Mon,  8 Sep 2025 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757340308;
	bh=vb82ch2PolQuZ3LON7RWp/5xl9D3T0ffJSkEaS2pbr4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Im2aYjjZXElcwJ3JhDmdgo+oUr3uUczlzOEdcf+V67u4jkobz/5g0Sr+c4jI+gYP9
	 zRi2zd9SHUMr/FswRdyzVUhMa8DmwecQ5Ljuc3eOx+d7wYzfJBi7oj0UDYgwDX0+DK
	 MOysWRqQy+8gJq1bbjEkNN+3jYSH0lVyqbBkJXj1lrjlUyXVB4MKVcEgJZ1SpDp2bS
	 8tk2vKHT1HjpkY+iXUeFUNBQLhOji+zs5PdX431yG1x0k27d8JZIiPLK87+q7c52UE
	 FBGuvC4djidnpVPFh2f7lhgEbB5KOqPT6Y4E5Di8SUdauCySza606UyUfxrdClzAWr
	 qxCM3rMvcPL1w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d6051afbfso38639777b3.2
        for <linux-firmware@kernel.org>; Mon, 08 Sep 2025 07:05:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YxNtNpKxMzEaV8AW2stu4IQoylkEGWj4vdF8/KQ3SYPHtDFEYa/
	MU7MtR4xsDh0UibgKOjqlCw1WL0dvNDFQvcjQz3ezNeeVBWwSJtQw+EtGZqtBxFlUB4J1MHOZui
	yBO5exikRyubjODcMPEJU66NE5GK7MEM=
X-Google-Smtp-Source: AGHT+IHWcTizPGf96bl6aUxKInCkfdjFEObrNN1SJ42TAulYD7k/klTNwvH0MN3FiaQEvwx1yaqv3dzKyyXpyfoCvBk=
X-Received: by 2002:a05:690c:868a:10b0:729:a1ee:9b9e with SMTP id
 00721157ae682-729a1ee9cf2mr38476347b3.20.1757340307673; Mon, 08 Sep 2025
 07:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250905133851.24318-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250905133851.24318-1-dmitry.baryshkov@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Sep 2025 10:04:55 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4J83xWx8Fay4paW+cxLfVgz6ykShvc=TDJU3Q8n1xukA@mail.gmail.com>
X-Gm-Features: Ac12FXwmoNHASuD6oZV9i1sE5VwOwmNAMS__re7C16Y7HKsusznfGKL_kabPn4E
Message-ID: <CA+5PVA4J83xWx8Fay4paW+cxLfVgz6ykShvc=TDJU3Q8n1xukA@mail.gmail.com>
Subject: Re: [PATCH] qcom: move Monaco EVK topology from qcs8275 to qcs8300 subdir
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 9:38=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The rest of the firmware for Monaco is using qcs8300 subdir, the
> top-level compatibility for the platform also declares qcom,qcs8300.
> Be consistent and move audioreach topology file to qcom/qcs8300/ subdir.
>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/682

josh

> ---
>  WHENCE                                        |   4 ++--
>  qcom/{qcs8275 =3D> qcs8300}/MONACO-EVK-tplg.bin | Bin
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename qcom/{qcs8275 =3D> qcs8300}/MONACO-EVK-tplg.bin (100%)
>
> diff --git a/WHENCE b/WHENCE
> index d0af98006743..03c2037cedd1 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8459,8 +8459,8 @@ Originates from https://github.com/linux-msm/audior=
each-topology.git
>
>  ------------------------------------------------------------------------=
--
>
> -Driver: qcom-qcs8275 - Qualcomm ASoC topology
> -File: qcom/qcs8275/MONACO-EVK-tplg.bin
> +Driver: qcom-qcs8300 - Qualcomm ASoC topology
> +File: qcom/qcs8300/MONACO-EVK-tplg.bin
>  Version: v0.1.0
>
>  Licence: Redistributable. See LICENCE.linaro for details
> diff --git a/qcom/qcs8275/MONACO-EVK-tplg.bin b/qcom/qcs8300/MONACO-EVK-t=
plg.bin
> similarity index 100%
> rename from qcom/qcs8275/MONACO-EVK-tplg.bin
> rename to qcom/qcs8300/MONACO-EVK-tplg.bin
> --
> 2.50.1
>
