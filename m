Return-Path: <SRS0=m82e=X7=gmail.com=hussey.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97127C2D0CD
	for <linux-firmware@archiver.kernel.org>; Thu, 15 May 2025 16:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C702C4CEEB; Thu, 15 May 2025 16:52:37 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9515CC4CEEF
	for <linux-firmware@kernel.org>; Thu, 15 May 2025 16:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9515CC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4768f90bf36so13570141cf.0
        for <linux-firmware@kernel.org>; Thu, 15 May 2025 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747327955; x=1747932755; darn=kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T2zx4RI7mU7vclV3qIwhS5DWPJSOxDtSlC+epIuxKMs=;
        b=PAgmbS2XbCKXMpp75HgbZHoMFrI4czKdEaNTAgQ8WaOvTeZS4BbhLuQymndGycIEwW
         PyTSGbdZQplDD7xYcw02maWriPM0OqTZA8Q/N1RZWzSctk+/S0wEsxNwxKOQ3XSmNRNz
         m//mLZJqIxNBOEIHc7MNvy5J71QDvhJxdi0YMajO3G8+IU8+jleIPsNEo1fiOPPWT5iQ
         bsiwSjTt1SvEO4sSSGWGjzfyVIBQlvPHiWIG4qfWMrEGTGmgJRCsVbrktC+f5DRHJVKP
         vOOPOyU2CR9VLMGuMlh2kUjF4PBFV3vVr36dsPo+d6/MrKAT/RRcXxGj2LYJ2CegIknO
         hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747327955; x=1747932755;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2zx4RI7mU7vclV3qIwhS5DWPJSOxDtSlC+epIuxKMs=;
        b=iJQvg0WUc11Ey4pLo89mZplmDA+CkzpDmv/zby9GmBcowjHGhUBwezL6eldSstiXlJ
         BdJ1+4UuJi75+RpFg0ds+OMt1bC6QUleBVpEEO0+d0+KqCSmFHRnJK9QMgaofNgkHbwM
         E7G1BiDIkqHXw3xsWDPSfAxjgBoLef+nZgtsrBcK+eA5rwbHgcjxOIONw4z6oUOrUK3n
         nRjkLQlUmiBHEnSxXoIVdc+y7sGmYgU93s9nYa6N+stbz+NWCXFNY4axIZ6+OL9sK7N4
         slYwhxY85euJC+QCCVHZ7Aj+KIHgXz5vaOEBtD0Z8syUoRkBILOqGDZWoQY+3jzWKhj/
         813A==
X-Gm-Message-State: AOJu0Yz01GiI347vIXmO5ntkAADs5xg7vTQm0fUnkt1rptevheprEc2W
	OmjLQo7B6viOHeovmH+zciX5EVAi/J9uz42SWBrrPgOcPR5a8WOUkoMY31bJDaeIj2c6o6Uj2Hn
	18AXaeF4aFGmFMuCX1LG9QY7gi3RKDJrOrQ==
X-Gm-Gg: ASbGncsmSB+HG1Ht0J2s0qSm8HxO0TJz0C4uMftoCpXLdeFI060qEKdR7H8wnNBXOOl
	0Cao/CGcwvCtstMkC4KYeZJH7d3235pncygT8DWncQ3UkioWei2FzclLqqys691RkFlDRFIgFgv
	eo6V7hYUWDQcG9IfY4YjN7FFvaXL1PYBBstcMJ8UG0uA==
X-Google-Smtp-Source: AGHT+IFgEWZjS5yNhMJbz03WPXTYLeaFeOcezmBw+gYdrMkn0Ev5nq/RTt1Ec8xsYUlrtrfI5nAQUYAJ0AAF5S/SbM0=
X-Received: by 2002:a05:6808:1b90:b0:3f8:2c35:eeca with SMTP id
 5614622812f47-404d8497217mr471324b6e.0.1747327944819; Thu, 15 May 2025
 09:52:24 -0700 (PDT)
MIME-Version: 1.0
From: Hussey Carl <hussey.mypackagingpro@gmail.com>
Date: Thu, 15 May 2025 21:53:44 +0500
X-Gm-Features: AX0GCFvnG7gMlOonmDm_LWuLCktNy0VgP5nVUGvZY6EHdJmmrNkc1RW0rdUfGmY
Message-ID: <CAKW8R_R_FZcFUy0PjiDFPg-UFn2sT+8cR3qTZOiU8piO=3Okyw@mail.gmail.com>
Subject: Personalised Bags and Boxes
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We make personalized packaging=E2=80=94tuck boxes, CBD boxes, mailer boxes,
rigid boxes, bakery boxes, retail boxes, shopping bags, label stickers
and more.

Simply provide us with the dimensions (L x W x H), quantity, and
preferred box style, and we'll provide you with a competitive quote.
Plus, for a limited time, we=E2=80=99re also providing complimentary design
services and shipping on all orders.

Thanks, and looking forward to potentially working together.

Best regards
Hussey Carl
Marketing Executive
My Packaging Pro.
