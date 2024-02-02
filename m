Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A73EC47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4BB6C43394; Fri,  2 Feb 2024 12:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF67AC433F1
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876581;
	bh=Y0RWYNQXBIinllb5znkEPLKEIYhubG57soevcgTM65M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Y8dVIt/YwBfzp0ABSY7V6f3z3XJI68LAdzWKtBi3eigE2/HW++dM4nvXTzlznLoUV
	 fEOBxv8ys3amlCFV8eHsh78dgTXcStJJ9+xoll2B9/WT3XqiOQis3RTbtEpOe8NepL
	 /l1ZmxRaL7zHhX3QcGZoZv8p3hkNNhA17gcCnOjSVw4iWFLsDcNpfeYt48apCfSJgM
	 efuz+rU5Fn4ggEgRfGDu6Q98NuaJJ1zmh6oh6Q6qTFUfpcU8RlXvFtFxS5+X1nCGh4
	 Wgd71m3+hxddCN7yDkNN2QUn/+s4rEEEfqiKGnH1OxlCNy3YzJaa0OXe5kq55o7FxC
	 RqvskeW8fbS2w==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-603fdc46852so20986287b3.2
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:23:01 -0800 (PST)
X-Gm-Message-State: AOJu0Yyqg3Aye453SUWFkZaURH9Ee4GBIYVDVSa/WM8G7eocD+bz4Um0
	p9Y4XqLP02I55c6cqstJRyT4OIRyaf2JBdCrl4ygjvErVqfHBsDcGnIxjo7wlaK2M3ku/vxTUMz
	RhT4jiCSGDfCH8/3VdqOfv1+EXsQ=
X-Google-Smtp-Source: AGHT+IGOzi8yjjcR0JvFG7rQ/Av6xeI4XTKjHIoT3mcEudoUigktG14VMDbV4J5XP/4AFVIPV5sCZ913D1Y1NuCX3XE=
X-Received: by 2002:a0d:ca8a:0:b0:5ff:bb43:2a69 with SMTP id
 m132-20020a0dca8a000000b005ffbb432a69mr6763584ywd.40.1706876581010; Fri, 02
 Feb 2024 04:23:01 -0800 (PST)
MIME-Version: 1.0
References: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
In-Reply-To: <465420cc-c40e-45df-9cc0-80244fed7bf4@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:22:49 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Pse4fJHG47XTt6jLZr8yqbdmneoOobb55ybxQeoMANA@mail.gmail.com>
Message-ID: <CA+5PVA4Pse4fJHG47XTt6jLZr8yqbdmneoOobb55ybxQeoMANA@mail.gmail.com>
Subject: Re: [GIT PULL] Add Audio topology firmware for Qualcomm SM8650 MTP platform
To: neil.armstrong@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 8:35=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> The following changes since commit 0c40df810685c15141413cee5bea7233e1db43=
fb:
>
>    Merge branch 'consistent-file-spacing' into 'main' (2024-01-24 16:42:1=
7 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/neil.armstrong/linux-firmware.git sm8650-mt=
p-audio-fw

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/134

josh

>
> for you to fetch changes up to 85d372744a19cf78f7437c6027d7037baa0f0a52:
>
>    qcom: Add Audio firmware for SM8650 MTP (2024-01-26 14:31:24 +0100)
>
> ----------------------------------------------------------------
> Neil Armstrong (1):
>        qcom: Add Audio firmware for SM8650 MTP
>
>   WHENCE                          |   1 +
>   qcom/sm8650/SM8650-MTP-tplg.bin | Bin 0 -> 24296 bytes
>   2 files changed, 1 insertion(+)
>   create mode 100644 qcom/sm8650/SM8650-MTP-tplg.bin
