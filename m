Return-Path: <SRS0=ZlMg=7F=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799B7C61DA4
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Mar 2023 20:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 374D5C4339C; Mon, 13 Mar 2023 20:24:18 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 439C3C433EF;
	Mon, 13 Mar 2023 20:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 439C3C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id z83so9324395ybb.2;
        Mon, 13 Mar 2023 13:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678739056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pZDe6aajlDn/vPWspLg6DIGEwvaTPEyKrZC158D4O8M=;
        b=E9YmHSdZCs+28wXwLV3YdhRJiAaZLZaJo9oEmQwSZ3kfi9qf7n7Lxfi4s2LZxghcU5
         GAGHSblsAwPu2lzFNzwVooxECZdpcy0dFInsFQRbRCb8Y325WvNg1aVOKhntmCMJQV2N
         drLpkp4zgw/r14MyE9K2BSLUs5uXkRh45tzhmUDPq8hCS3+z+KzNSZb1nI9gSD9xkLB6
         C15rNuCCvA/rX6DGmgEJK6SkWV3tN13o/N04VtjM/i70JMivbXl/bOhZfMVvxLl3/DPo
         8t+5PGJBiZZHrO4PBMIr3gbzEBIwXdg7/52HIH51liuFs0NqS3qrVb8Pe92kCaxdQpUJ
         HeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZDe6aajlDn/vPWspLg6DIGEwvaTPEyKrZC158D4O8M=;
        b=OwmkehDWAAXedPob95FYu/jERAm93sVKuWN6ZXxp/L0i+Dbd/noKcJNmSeM7Fld0hv
         pzU+HHnmVGdhzTvCPd6k83idpA4y1XNrFCU7pk0uBZy9VznVRnBqpN03q+/bHatwUATW
         4MwWvXVIhP06DwZwIhCBD4SO58DR4JsVFYDtneEr1TpKk2HWf8MlXDyHkQ0lxs2HLqWc
         1RJs3TA/Qoe1Qq5Ao1sjCO3y7b5vx5ZL7gqcKdGRhsVWEKXXb8lTyfq5jSBS/po4OSTn
         /YLALPtZRDHNeiDvX+rrfAKIB1ESpM6nSkXJObHzPyCDqCY0kEa0pioFHevtLONBjkMB
         ccQg==
X-Gm-Message-State: AO0yUKVFz2PHc4x9xSMA+s8yE0OB4lVme7oHsKOo/ZL/OylRoJ27PuSY
	h+2EYZcwN8XgxcpxJe7Y1+hPMt+h8iGV/OxO0MI=
X-Google-Smtp-Source: AK7set+B3279pRdb6fP9PYq0sezr7Yi2oVMPBJKcpl2e0riUyPyt1RtOrBgaEOdSGuOn5ipgIRiRpWvTkpb8DiCSAjo=
X-Received: by 2002:a25:9f0e:0:b0:b3b:fb47:8534 with SMTP id
 n14-20020a259f0e000000b00b3bfb478534mr2657600ybq.5.1678739056198; Mon, 13 Mar
 2023 13:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-7-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-7-e2b71974e842@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 13 Mar 2023 20:24:04 +0000
Message-ID: <CACvgo51S927dpSntF8Y4MmsOQGzw6P21mkdE2RP3n18+djfOEg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 07/16] check_whence: error on directory listed
 as File
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>, 
	Adam Sampson <ats@offog.org>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Mar 2023 at 18:56, Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> No occurrences in-tree, but it makes sense to sanity check that.
>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  check_whence.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/check_whence.py b/check_whence.py
> index 7ff21f6..130966e 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -47,6 +47,11 @@ def main():
>      known_prefixes = set(name for name in whence_list if name.endswith('/'))
>      git_files = set(list_git())
>
> +    for name in set(name for name in whence_files if name.endswith('/')):
> +        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
> +                         name)
> +        ret = 1
> +
>      for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
>          sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
>          ret = 1
>
> --
> 2.39.2
>

Josh, humble poke about the remainder of the series. Would you have
any comments or suggestions?
Note that many parts can be picked individually. Should there be any
merge conflicts, those will be dead trivial to resolve.

Thanks
Emil
