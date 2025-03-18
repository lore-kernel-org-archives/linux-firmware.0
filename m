Return-Path: <SRS0=/GBh=WF=gmail.com=maxim.cournoyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFDAC282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 06:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3986DC4CEDD; Tue, 18 Mar 2025 06:20:57 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 540E2C4CEE9;
	Tue, 18 Mar 2025 06:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 540E2C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2241053582dso48881725ad.1;
        Mon, 17 Mar 2025 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742278855; x=1742883655; darn=kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR7MRwXxDlb4vY3C6Y2lYoPllxX/I/PZD4KyX4nbvqg=;
        b=OJY/LLfDpBxeYJYP57/O/72WKQYpjwg/FBbQu1TlYq+w+E1AH6MhYZ7kXopR3CkXLE
         yW9Iz/CBMfa53wReKU50g5fGnlsArEsPMfyfWcP+eJvqpZC/YNxlL5Ss2wk+6pef9Tq4
         whvIeGXW+Phg2cab6rYFIdcSB8Mp0SQ4pJFly5dB7Kntx5GGBtypxpJE85W7lEdMxajw
         aCauVcwqcfpAskIDXG/DqfMOvM+w4skGLB3Dn7fhfC973X/72KEICFuEuR+qTafGrLfa
         E5YOUvrLXCZS6YExmvHq65MeeQ/1pIYGWnsnIuJizXioSmiVLzhS26LskjXi5LQu7YGx
         ub4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278855; x=1742883655;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR7MRwXxDlb4vY3C6Y2lYoPllxX/I/PZD4KyX4nbvqg=;
        b=S6hG0d3DnOb5JJ2FIYRaoG7AH4JzhISLcL7LczKgihje6GVhx9+2RVVKe89YPwPrTK
         QZRR7r5vWmlkFfydA1cBQpCZpUberF5aCPskF3xY1MeRlkbZKXL9vUO6dTnzJUUz7cFa
         +Dx3a9vi068UEmuCZXgj30bh8LUyQXN61qrbt4ojSXGJp/LSWua5Fnpx94zfTuTKrUQc
         55dPnTEwzSdFnB9y7+x6kmxBVjM0VTaRKqEQJ4yEZH3Mak8QxtXmbZJqRMPEICyiDuVJ
         78uAV8hzO+cHGrBz/WP9/GI0kcciKpw2U4zm9siMJ4UkHvuSH6V2gofK9Uw9Fp8GgItE
         OLlA==
X-Forwarded-Encrypted: i=1; AJvYcCUtExgFGk0/CGFsuu1qIC1/f/IgbdIOV+GMCMCSUcKpAMD9/WQi3Tufb8HkaUlf3KF89mrcmzMLaXnW8WKzFA==@kernel.org
X-Gm-Message-State: AOJu0YwyOcthnExPyveZupn+lUj4ruqB0lLu1j7rFSgVPKbtPiBPGMdF
	CAhF39LuZsAqDOPN+5lv0qYtQVbyPZtWb8C5c125Mkku78ICgvctIb5KU4zO
X-Gm-Gg: ASbGncsH9tumoyLX/GfqH1psw6LisdxUH33nIZnN+AzAlSFz4TswxySkaJ88H/+bVs5
	jgHWLP5Q0IzjAN2S9WYWavSPtgw5t12IPfuZgmK7gY8n47HRVP7LTn225cJd/RMSJ9MiKxwSWBL
	lIuiwXYjXI2QwN1mJM3EpU/hni9yyNaJv5v/LDWqbs0p42R85I3aI6xkBv5+5fnOKjT/haYI08I
	Js6kRManJPsd1pGTehr3EPmiLnOHn/cek8oRVPX1NPNwU5wVBKyotIn4AtXLt9a+YHhy9AcWKZi
	GIkMi+Yj0Qy6I6Qv69YigxJT1ZzGxhAHK/RIwTmglJQ=
X-Google-Smtp-Source: AGHT+IFBUWPjKIK5D+m0vKF9wFeAYgiNpurE8YZKhFQ2ULEEMo3hDm2TAclNVOdgx5EMOgEKNbqYHA==
X-Received: by 2002:a17:902:f70c:b0:224:191d:8a79 with SMTP id d9443c01a7336-225e0ac31aamr198333665ad.27.1742278854987;
        Mon, 17 Mar 2025 23:20:54 -0700 (PDT)
Received: from terra ([2405:6586:be0:0:83c8:d31d:2cec:f542])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-226325521ffsm5575285ad.22.2025.03.17.23.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:20:54 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: <jwboyer@kernel.org>,  <superm1@gmail.com>,  <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils
 parallel is installed
In-Reply-To: <20250317191606.64181-2-ttabi@nvidia.com> (Timur Tabi's message
	of "Mon, 17 Mar 2025 14:16:06 -0500")
References: <20250317191606.64181-1-ttabi@nvidia.com>
	<20250317191606.64181-2-ttabi@nvidia.com>
Date: Tue, 18 Mar 2025 15:20:39 +0900
Message-ID: <87r02uyi4o.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain

Hi Timur,

Timur Tabi <ttabi@nvidia.com> writes:

> The copy-firmware.sh script can use the "parallel" command to
> parallelize some operations, but it needs the GNU version of
> parallel.  There is another, simpler version of parallel that is part
> of the moreutils package, but that version confuses the
> has_gnu_parallel() function.  So first test to make sure that
> the --version parameter is even recognized before trying to use it.
>
> If in the future, moreutils parallel adds support for --version, this
> script should still work because that version should never report
> "GNU parallel".

Did you test that it works with moreutils' parallel?  When I authored
this change I went with GNU parallel because it could ingest a list of
commands from a file, and I couldn't see moreutils' parallel supporting
that.  Maybe I had missed something?

-- 
Thanks,
Maxim
