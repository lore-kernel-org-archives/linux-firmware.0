Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E504C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BD70C36AE6; Thu, 16 Dec 2021 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2611FC36AE5
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665821;
	bh=HUoRYGTo8eHHN8Z7vLhau/1lZa2atY9owZBoBS570IQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CVS6uqCiylufdO9MKYfpkYE1HJVWSKN587A397wXtFL/TTjgHPl2eQXAhLSbnbVbe
	 /bDFnT4PrkpzAbHMEDyJX5en+jyF3hr38bZwFEPpOFDGF3PmGmjQ1IZqhDoqirSasL
	 ndMAOSV1WiDLYgggYr2l5bDEQtfo3XjpJPNazaMzuJLFTDOfNArhmNJFcscjP3ogbP
	 evmW+pmRrUQs6WcuJhbSqldGWMg9xdxVgkDWOLdCglx44hqvPPkHxeFAfe5AmxSd1u
	 /feE0W4VcYnoll3K2RPuzbPMLV/QcJnJncnQqNuitS/ewbfMyeU1dweZ04s+3jP44u
	 A/w4uN1rMUe/w==
Received: by mail-io1-f44.google.com with SMTP id k21so35406729ioh.4
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:43:41 -0800 (PST)
X-Gm-Message-State: AOAM530cXGgfUMopDgo0deGzSaIgqxry8C+0lcSR+tiuQsKRyWq9RNvk
	3yKvkpeWd4obqzP/CGKDorDviGOoAAvm7SjAAfQ=
X-Google-Smtp-Source: ABdhPJzqJ6CYrsvw3JytZg3eeYbJC841CPBQYMicFrUMGTlQBFAZekPsivrjr/zGd8i+3gXgoxDhJGNDYd0e1HvI2SA=
X-Received: by 2002:a05:6638:dcd:: with SMTP id m13mr9790790jaj.254.1639665820362;
 Thu, 16 Dec 2021 06:43:40 -0800 (PST)
MIME-Version: 1.0
References: <0f133129ea034a3da510651fde85c29c@realtek.com>
In-Reply-To: <0f133129ea034a3da510651fde85c29c@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:43:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6HcazzZHnqPZxCkRrTSwpEx+OEy-3PiPM=ypB12aZh4Q@mail.gmail.com>
Message-ID: <CA+5PVA6HcazzZHnqPZxCkRrTSwpEx+OEy-3PiPM=ypB12aZh4Q@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.33.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Dec 9, 2021 at 3:38 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update firmware of rtw89 driver to 0.13.33.0
>
> Thank you
> Ping-Ke
>
> ---
>
> The following changes since commit 4a7e1f5cabaebe5c044b94b91149f35471d1e983:
>
>   rtw89: 8852a: update fw to v0.13.33.0 (2021-12-06 16:03:37 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to 4a7e1f5cabaebe5c044b94b91149f35471d1e983:
>
>   rtw89: 8852a: update fw to v0.13.33.0 (2021-12-06 16:03:37 +0800)
>
> ----------------------------------------------------------------
>
