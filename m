Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B0AE77198
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jan 2025 12:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C6BFC4CEE0; Tue,  7 Jan 2025 12:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76551C4CEDD
	for <linux-firmware@kernel.org>; Tue,  7 Jan 2025 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736253080;
	bh=2v/ZYNSPp4GL0GmzoA+jPnSPSJ9u3jDI8+Ro3MaPKd4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tH1l+TtiDzjeFAoU9XDmqXeoztmoqdmENS1Kf5OJB4SiqZpDISX+LIVsgUjwzFEou
	 Ukv+7fjDprR0EoMJ+U2wVgATveRGGldduQ+642meoChBB/T+vwuhvXguiflYKLjGRj
	 E41HkwpjqksTme/05orIjAO+wUtI5DgCimENOlbpv8QzIguz+Dhpwgmy4YbRPCV4NU
	 ZvkuVTz+QoQY2k9dXzAjSwuC9efJb6KmuXipVvB13JXtJrB/P651a4ur9MNhIEIsKb
	 X1ZMdH/vrJBaTF/DVAQUSqFB0wvrFclRJcJ2/IQvcp+taejKxM4x1W4ebk71Y33JvE
	 juBu2gUvHbgAg==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so21053749276.3
        for <linux-firmware@kernel.org>; Tue, 07 Jan 2025 04:31:20 -0800 (PST)
X-Gm-Message-State: AOJu0YwMhNjOAqTvn2VAvNVCn4RLp7G0NSFL4ufEa02wXW5/4DIuJ6N6
	fF810UzhHXIA7Shph7SIlFa9Xkrmn/cE2NMuYtfl10vpXDbkFqYI90lBJ9pZo6wttS9nMW1Qgg0
	n/zID1hjgDACh5RM1OwXJOJ8iCGQ=
X-Google-Smtp-Source: AGHT+IGcf0sgzUp0zx7plVtGVIThKpl3Ou21BhMZvnc2HFDFc40JFtc1VttDK/EI6Ykhfemo9IzL7DZpzaNyWrryL/o=
X-Received: by 2002:a05:690c:8c04:b0:6f4:1a7a:ebeb with SMTP id
 00721157ae682-6f41a7b0408mr260959177b3.32.1736253079623; Tue, 07 Jan 2025
 04:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20250106212549.3381550-1-alexander.deucher@amd.com>
In-Reply-To: <20250106212549.3381550-1-alexander.deucher@amd.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Jan 2025 07:31:08 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7xqeoGVNHhjbMuwNmNcyNkrk0++Xa54xnHHf0_OLkaMg@mail.gmail.com>
X-Gm-Features: AbW1kvZM7zdkhtjlJlVvzLt21UXBm-c8CpC3ZE5OzvDAtNlbjXlPRH5TOSwU5qA
Message-ID: <CA+5PVA7xqeoGVNHhjbMuwNmNcyNkrk0++Xa54xnHHf0_OLkaMg@mail.gmail.com>
Subject: Re: [pull] VCN 3.x firmware fixes
To: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario.Limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 4:26=E2=80=AFPM Alex Deucher <alexander.deucher@amd.=
com> wrote:
>
> Revert back to older VCN 3.x firmware to fix an encode regression.
>
> The following changes since commit 209c18b0e7cd2de304ad11c1042b085429fab1=
b4:
>
>   amdgpu: update dmcub 0.0.246.0 firmware (2024-12-06 18:53:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-01-06

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/399

josh

>
> for you to fetch changes up to 8c576df27fbe8280c338cf23a8a03a3e74503647:
>
>   amdgpu: revert VCN 3.1.2 firmware (2025-01-06 16:06:38 -0500)
>
> ----------------------------------------------------------------
> amdgpu: revert VCN 3.x firmwares
>
> Revert back to internal commit:
> 97ae5dc916b1b174cc87c1f1502a19d2c044e6e6
>
> The newer firmware can cause encode timeouts
> after extended periods of time.
>
> ----------------------------------------------------------------
> Alex Deucher (5):
>       amdgpu: revert dimgrey cavefish VCN firmware
>       amdgpu: revert navy flounder VCN firmware
>       amdgpu: revert sienna cichlid VCN firmware
>       amdgpu: revert yellow carp VCN firmware
>       amdgpu: revert VCN 3.1.2 firmware
>
>  amdgpu/dimgrey_cavefish_vcn.bin | Bin 579184 -> 587376 bytes
>  amdgpu/navy_flounder_vcn.bin    | Bin 579184 -> 587376 bytes
>  amdgpu/sienna_cichlid_vcn.bin   | Bin 579184 -> 587376 bytes
>  amdgpu/vcn_3_1_2.bin            | Bin 571440 -> 579376 bytes
>  amdgpu/yellow_carp_vcn.bin      | Bin 571440 -> 579504 bytes
>  5 files changed, 0 insertions(+), 0 deletions(-)
