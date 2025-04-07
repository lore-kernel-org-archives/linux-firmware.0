Return-Path: <SRS0=jX54=WZ=gmail.com=ledger.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC1EC369A1
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Apr 2025 19:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0D5AC4CEE9; Mon,  7 Apr 2025 19:15:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 244C4C4CEDD
	for <linux-firmware@kernel.org>; Mon,  7 Apr 2025 19:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 244C4C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2aeada833so924625766b.0
        for <linux-firmware@kernel.org>; Mon, 07 Apr 2025 12:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053356; x=1744658156; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hAteXgn1FRXQquVhdxVrhB2cprsP03usvpXPN5ySqZM=;
        b=I2Orf4E+nMVPtjD4mfcYBEFVXJNhcziNgtkMww0sXMuLw6FTGJCMx+kJxu411W/IOy
         UlufY9nE6QPsBMJw8AaPsAjkV0XVwF9gXPlKPbyAOvauwiDt76zVeQDXQLOXITGzI/g/
         gVvdqND+XxvF+LP2okFhBUmmjGgDMP1JMHNOibhwproYI6kNGZLLR0UvDi1chEBQtEAL
         sib5Fmf45GJyiZnteK/A58Zqi6t4Ld6fAOTlFGuvmGSv+n3mlQ7qIgpPj9hn1FZ5yMSl
         tt0Ewq73wa7VuR8OM4ap4xFqUE6IRG6IUIAk1OFjEEveCEldYUBN2mqQgUILfDDJ3roS
         s+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053356; x=1744658156;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAteXgn1FRXQquVhdxVrhB2cprsP03usvpXPN5ySqZM=;
        b=CW6pE2Qzdbh64JUaxeArpjsGNKY2JMnTeNxWN63Bhp9tXnkLzCQGEDx+Wf1En1M7UT
         u0qXdt2kuRK0MRF8QFfP6QyLqbv3ebqBBytCmychZfVLXNEZ813cuNDR4rDt4YA0+lct
         uacNcP5aQsLwV9mP9bMmCUpX7JmYXxwoqgfxY/1dwbR69G0V3HV3vXIGCCh4dQ4u0GTA
         XRq7khjkXcIL10TXBGteCSEpNqfeph4RPOK6Cjtsd452nViMouOs6d9b6w9RCPXzAY05
         DTWa/QY4CSHJxUodH1BQ2ZJpjEjvzxnZvfU+5df3wJqY2QF80AM4rSCHAYrWQO9Kmciv
         zLuQ==
X-Gm-Message-State: AOJu0Yz69oFaXcmn59qcJdtemCjwN5JjZfeQ0sVWCzszgLWl2eJxWgjX
	0cXOHFZcu+zyHO03mfkWYpXmyrPaEWReXfD70Zk9HDJ0EeKK4uMmfhVQOPGmg06gPxcCLVjrxtO
	aElpRSFiEfxTrlqch3afXQM9U/Jh9iA==
X-Gm-Gg: ASbGncuX40QmOMZjpoaFOa7parD7DLsSQWw6WChXRxjUkjbd5yie3HFS1//q47gombO
	1Zw5SJN8h13Oxbql8CYr1Fx7LE7vchRO9fVL5eLiXf9/Dz2xgcXQ6ykmmXYt8FZ7/D1tgvRHt60
	7DhN3KcuD26MdgsTWIeGjbu0D/
X-Google-Smtp-Source: AGHT+IE3NhA8zBpqM5OXGAX2I9b6hUs5ftMFBqj3h6qjqnhfz++Hd1r5Dw87bJqaRnUKa+rwPUnsBXDbb7VcC3hoNuM=
X-Received: by 2002:a17:907:7f92:b0:ac7:b1eb:8283 with SMTP id
 a640c23a62f3a-ac81a68be82mr56363966b.17.1744053355981; Mon, 07 Apr 2025
 12:15:55 -0700 (PDT)
MIME-Version: 1.0
From: Ledger Lindin <ledger.mypackagingpro@gmail.com>
Date: Mon, 7 Apr 2025 12:15:44 -0700
X-Gm-Features: ATxdqUEC2jnTme4v3TSpm_u390OgFf1PT7kd7_0pFClpYTLNlSjRWRIOFR9S0AM
Message-ID: <CAF0DnMUaKspHrCW30w45KwL+4hyW7Kc-4+yOjSGC=DVz7Uka+Q@mail.gmail.com>
Subject: Packaging Made Easy
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="000000000000c0b6710632351009"

--000000000000c0b6710632351009
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We make personalized packaging=E2=80=94tuck boxes, CBD boxes, mailer boxes,=
 rigid
boxes, bakery boxes, retail boxes, shopping bags, label stickers and more.

Simply provide us with the dimensions (L x W x H), quantity, and preferred
box style, and we'll provide you with a competitive quote. Plus, for a
limited time, we=E2=80=99re also providing complimentary design services an=
d
shipping on all orders.

Thanks, and looking forward to potentially working together.

Best regards,
Ledger Lindin
Marketing Executive
My Packaging Pro

--000000000000c0b6710632351009
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>We make personalized packaging=
=E2=80=94tuck boxes, CBD boxes, mailer boxes, rigid boxes, bakery boxes, re=
tail boxes, shopping bags, label stickers and more.<br><br>Simply provide u=
s with the dimensions (L x W x H), quantity, and preferred box style, and w=
e&#39;ll provide you with a competitive quote. Plus, for a limited time, we=
=E2=80=99re also providing complimentary design services and shipping on al=
l orders.<br><br>Thanks, and looking forward to potentially working togethe=
r.<br><br><div>Best regards,</div><div>Ledger Lindin</div><div>Marketing Ex=
ecutive</div><div>My Packaging Pro</div></div></div>

--000000000000c0b6710632351009--
