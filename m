Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE4C3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Aug 2024 10:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00AB1C4AF0D; Fri,  2 Aug 2024 10:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF976C4AF0A
	for <linux-firmware@kernel.org>; Fri,  2 Aug 2024 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595603;
	bh=AJz5Ah9Q4cY8VhhG00ifJ0jPvuAD0+OO+TPeIffBGZM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Yfrc1R/KlCqd5tT1aa09d1AIcYgaeQSZ9zm30pLnFPu7cERjUCoOkANez9bHdUwzc
	 /lrysLonXNpXFySR8nXdJN8tLePc5ZjM1axdqUnQzXSKuGh1m0xukYGksAydinh39H
	 8SRGOmukVHAC4jMybWidaY7qxdejbVe8v3TWhXbs3wyUVQjAFQYqkL6+rBfO8/Fj0/
	 meLQQTrWDoWctqyDfMpGPyT0tBf+8SNZMXTUu1clCVuOg/Y5Vz6dimRc1bDYSgGN4x
	 dsa3NYRTm/wWYaGRTzIzGvjGGp/nKcqr/m0G8aCxoYC9rPnFTEbHy6Hce8OzaRKfjY
	 IQYqidfjLm9sw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-66a1842b452so51209407b3.3
        for <linux-firmware@kernel.org>; Fri, 02 Aug 2024 03:46:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwFbYp9iuve93IKloFG1el7IzfpWaz1sJnq6NU+g47Ag/tqTPf9
	pAvgEzSiFkjrgdgg3XvwdGs2m3lJh8xVOaIhSfsjTDxMeXVw2N8g6RYSz/L0Q6JXfyTJSG3fr5m
	oSCfgkWS3bAJ4pNhBCPlSAijrq5o=
X-Google-Smtp-Source: AGHT+IESu3RmcR5HT/Mr80HDC/Ar+BgaFbnb4qdGt+Axd2FltPjm3JrcfIcfQ+9NNnjv/l/0sO77EiqXAxsE9OLYsQE=
X-Received: by 2002:a0d:e485:0:b0:64a:ce78:4f7b with SMTP id
 00721157ae682-689601aba85mr34484537b3.12.1722595603052; Fri, 02 Aug 2024
 03:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240802063930.3259604-1-Wayne.Lin@amd.com>
In-Reply-To: <20240802063930.3259604-1-Wayne.Lin@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Aug 2024 06:46:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4D7iGo09KKEZ5BsBW4T8X48jwXsesYi78Z2-2kC2Gzsg@mail.gmail.com>
Message-ID: <CA+5PVA4D7iGo09KKEZ5BsBW4T8X48jwXsesYi78Z2-2kC2Gzsg@mail.gmail.com>
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.228.0
To: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 2:39=E2=80=AFAM Wayne Lin <Wayne.Lin@amd.com> wrote:
>
>   amdgpu: DMCUB updates for DCN314 (2024-08-02 14:28:34 +0800)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-02

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/264

josh

>
> for you to fetch changes up to 3b14fc1e18ffddbdd5f7a457eee9e8654137c7e8:
>
>   amdgpu: DMCUB updates for DCN314 (2024-08-02 14:28:34 +0800)
>
> ----------------------------------------------------------------
