Return-Path: <SRS0=hLJE=5H=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85898CCF9F1
	for <linux-firmware@archiver.kernel.org>; Thu, 30 Oct 2025 11:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A9E3C4CEFF; Thu, 30 Oct 2025 11:02:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 841C7C4CEF1
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 11:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 841C7C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9MhcS3115819
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 11:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F09srEgT+wkhmDgzpYk/rQVgPwPlNPQD8SJFGCQLLXI=; b=IR/pDmhzUq83WM5Y
	HVqfvIr6Y5aGbJUCkDYi3Zl+xzJhBffHBQQVWIvKAWlC8Y3fkU4UGPl8CvaSrxRi
	6UWsz5Qbdg21m8Mq9oubAQc0qhJyNR+iMO8KMHS5xEucn1wdGc6DjGo2xCBEtvTk
	e0Cm8yKon8MrMFTOOfMFNVYkcJMEJ2eiaIKtooANXjHUFVaTKLnoPQIEYIPEEK1U
	/D8olcgknxu9lRxce15U1BA49wX2ud2FEU4wtS0cCBQHPfyeAthfh2TZeiXj74nK
	DJmYWByVJpyR4MCvsSYSYW1Tb/r42DtbkZxnA0qr+Y3/n/lHEvi0jIBQz0GPZxsG
	RGQHvQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45b409sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 11:02:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27c62320f16so8221305ad.1
        for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822133; x=1762426933; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F09srEgT+wkhmDgzpYk/rQVgPwPlNPQD8SJFGCQLLXI=;
        b=TRl4EqHCFKVhEz5A+B8fjckEiLjtWhE0D1QfLLn5f8KRwPR2UQF01V2lsDEa8rUDbC
         ZQNgQIA4FqD10OjhLc+HeXmAt70znLrnDrPVvZh0zMsrGZeKOOMVp2pr54XkRKF0KZ4W
         LMPAqvn3yXgKhREl2Fl4QvEW0A30HniM1GRn9MBeUf/U4/KIIsE664pL+7JmEsnu7efP
         HZnxd3tjwg05HFZ12u3+PDJTGDVskS6+FiBzsBoIJXVdzPDtjOPSsvjspNalJFPSRrGL
         7nayvhPUEJjAgLF7+fUa+H68h3NPKFS3jBT6ebSnZMDZkmHHf2VTva6VpbvrhQGeIQNy
         l90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822133; x=1762426933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F09srEgT+wkhmDgzpYk/rQVgPwPlNPQD8SJFGCQLLXI=;
        b=xQ5E7GWkWHe0ftts33mu0acsZI/9ho3jc/Ea7nrYIrQKbKjOlnNGJmyArY2ybMItFT
         xk1JH7vxdEUhlrCYnhVH7KCY7ci0R40fpTJZNUGNp11KY1NIC8chP6EQCL42TpAWiLNZ
         SJRqVqhETPzjA0dNF6H2u+6pihk+GpCA0SZRS8LPl1pQPyJrQrdZ1FXA8OnU2ijHFS0s
         SOUGNdKDUskvx9pCzN5sVBEXzPYvgMhMSlxbPYevEa4fs7R+XrP/rtcyLPhYZ73IS8u7
         NimuWC+X5koxUBgUdHfzWY6DtAk6wVeQOCHkWbw1nbA2bjXsnH3l04DQugY9XsPUyrfW
         lcJQ==
X-Gm-Message-State: AOJu0Yz40+Pm1Wl8bDNUuyezpphSsKqjogz3RwLGm69MJMOFABu27ln7
	uBSQZly6xxaYBj4dK0c4zhP7QtdBYNE7fABZDSrE4RvcDwLS+0bASwVrFyOtpMyAFlcojet/ISi
	5aB9s1dZ6UqK4BePU1Ba8ccOk1Cw3Q+9agnlAYca37m7/NRFPg01mWCZW9LCByqF59UP6GpUFHA
	iC3yOB8skuwgj6gP85mt+iAuZe8jqqB9DM9FhUnw==
X-Gm-Gg: ASbGncuM2OR/JJ+DCT6T0clTV2ubeePdDkux6n1IsXhjwsT1gYCP5EarpeYLrODcoUU
	GIHbTCNQJ+sR8ppmyM/Zidr93vTZIbpJ3W3qEsyfGoLwvLE4HhTIyc8jFmN2jEBN9Y5W5sBVTat
	Ty63xazPyU1fsHyN7MxUDCxp9QTVGV+EtSXw5hmHQ/dwLPwsz/u4N8TMsy
X-Received: by 2002:a17:902:f54c:b0:290:b53b:7459 with SMTP id d9443c01a7336-294ee0baedfmr31514585ad.56.1761822132572;
        Thu, 30 Oct 2025 04:02:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMHqK0Lj8HAtkmxfUd1nMM6yCtWatxWahGX3M7WuSKSmkGsCaOvJE/Pmkgzb4Fw/ADDc+qMHTgXe9SVvPf/Gw=
X-Received: by 2002:a17:902:f54c:b0:290:b53b:7459 with SMTP id
 d9443c01a7336-294ee0baedfmr31513955ad.56.1761822131746; Thu, 30 Oct 2025
 04:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
In-Reply-To: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 13:02:02 +0200
X-Gm-Features: AWmQ_bmBFI5iwCScYeQ9zu_P_jXT7TFfuEMCtO6y62HGVltqMN76Ht0YUIu_rBI
Message-ID: <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX7P4XX0IJRDBT
 eESYmnb7h9qaldMEaXQDLrWhWf1lLu4gQdZctRL6sKahX79iVjLHhu6uFoSkffs3cCBe3U07gI1
 6/8nEBugibmvnJW2MfZWVQLeAmY9FCJfmyDmAoKUdzyDKKqeKK7woEpGisO32tXhtWwhdvOyKZ6
 BTTP3t8O4HN/Xb1jEta/gYOSTIla43eAZGSTdDffrhCOFNK9RyUJayr3wHhPnS3cjyXAqv5jjPv
 aEsepjCsy0xjpT6ycChUh2STRLaKpY4eLnk/l/YhaheuKsnOgrrmCvdxuaRQ6UDDFb0Br3lxoY4
 Fb6BtnmiQ7XZTmWYTDj8sDq0KBkXFH+f2HRSZByl4apoWtYVZwHFvnc8vvMHbKp7H8ChfJR3R4L
 eVUoFiOuJTTvVYwo1UCiXO4zC4eXng==
X-Authority-Analysis: v=2.4 cv=KePfcAYD c=1 sm=1 tr=0 ts=690345b6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=JsOvJneI8SfXUR9R8IMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: XOrAPAJN2jCi52zDWDgJ1ux2_hPc68In
X-Proofpoint-GUID: XOrAPAJN2jCi52zDWDgJ1ux2_hPc68In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300090

On Thu, 30 Oct 2025 at 12:50, Zijun Hu <zijun.hu@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers
>
> Here's a pull request for QCA bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit bfc84303530a1cdd603fc40aa25b4452f10870=
dc:
>
>   Merge branch 'mt7925' into 'main' (2025-10-29 11:21:38 +0000)
>
> are available in the git repository at:
>
>   https://github.com/zijun-hu/qca_btfw move_qca2066
>
> for you to fetch changes up to 45b3867b446ec97326ab4d5a5cc81c9f811132dd:
>
>   Bluetooth: QCA_BTUART: Separate firmware between WCN6855 and QCA2066 (2=
025-10-30 18:21:04 +0800)

From the commit message:

> WCN6855 and QCA2066 currently share firmware in folder qca/, but this fir=
mware sharing will be broken by WCN6855's firmware to up-stream. Fix by sep=
arating firmware as following: - Copy firmware used by QCA2066 from qca/ to=
 qca/QCA2066/. - WCN6855 still use current folder qca/ for its firmware.

What about existing QCA2066 devices which might get a new firmware,
but not the updated kernel / DT?

--=20
With best wishes
Dmitry
