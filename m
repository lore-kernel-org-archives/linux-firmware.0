Return-Path: <SRS0=zEwb=ED=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE0ECD8C8C
	for <linux-firmware@archiver.kernel.org>; Sun,  7 Jun 2026 18:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3ACC11F00898; Sun,  7 Jun 2026 18:23:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780856614;
	b=RGc7yq4sYdEe1kkE3lO5tjGwVdwfHnciECuL0KPVhY3ZfUIVYhwE3AaEjGdyx00NRdKk
	 V09jP0oWPsG7Gqg2R5YgvRobXq7fQm1baNF52chCCKlPnhM7CKoGBzVtdW+7DM5hwC20s
	 1SG1pEn7jkMEnjQQAMWH06K4rZI22X262q5yPRYCF/ew9Gn67em5dK/0dIEL31rgjMOg0
	 mkQOJLJQbPCGXR6u6QliH0HCTkaAb30Rtw599BpDErIe3QSVZbaY4264wpRQ5/xT6FhSu
	 p1xqQh6ZMaum5hUsVSOYEalCgWvaoL9RV1NHnDmmomzWeia+xaLHXHMRHFtLumZKuYw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780856614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=97SWh4KjNEqT3PrLgTRSyFPPxyUwqaBsCIU8N1LHXrM=;
	b=P6iSQOF3vJXX7GB6xy26umI6O2SFApE1B82sxmcj8i6S8zL8j1EqPqgMnoaO1sDLtYyD
	 1roEaXMPWMbrT/wnNn/07Biesnhepc7FqtCNWQ347DkEVZ1V+kIO5kRiGTcuXQ/AfuQl5
	 tMW4nJ8GRBd4Gauc0fZWUrJQEHz0BUIluI093ulpvJKnO3b5pAPde2uJgt779U8wSNcd5
	 E/zk2V8APkLx3H2mFJdMLBZ6glMBxa9KBoY/Z/zU/lHR166DVPzB977UOLg1caLD1fAO3
	 xtVCShZ6DnxFCa/ZXUehja7KhhvO+2l5l+0kFkVoKQurFp5RjJ6BQZrrRWwRO1Q7X1A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8tva4FM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Yu6H89/k";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 916691F00893
	for <linux-firmware@kernel.org>; Sun,  7 Jun 2026 18:23:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V8tva4FM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yu6H89/k
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 916691F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjnJX440155
	for <linux-firmware@kernel.org>; Sun, 7 Jun 2026 18:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=97SWh4KjNEqT3PrLgTRSyFPP
	xyUwqaBsCIU8N1LHXrM=; b=V8tva4FMbeNriG/8jjJjAudEE/HY6IVwFkqnUy/W
	pfUGsNGTyoVSw+9dP3glg3stq2h0mGXsTowzxB3SqMmw9YBvqcbPzU2shOTW33oo
	wIlw65poC7JzhWclt6g10V3qSrxx4JSb3yJCu1dvSyBJNeaY5j7TtVK1+iYM0csw
	pZl5ckdcRbc//D4K4wmZ+n8L2AvBQcjch50fpc8RVOcNGEhoN78lg6sd3CD79ga2
	iSPaSFLaCzcWrFkTFWYLMHQvSENM6/s3urcFSdM059XbdEtS4tTlMsbosFBqzmRY
	mmQkHMyCVrU0KYRCJEOA3O084OpNncIlePI1rnQ1ZNNFyQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cvypb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 18:23:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-842308adb3bso4985045b3a.0
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 11:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780856612; cv=none;
        d=google.com; s=arc-20240605;
        b=cn1c531JxkChIpd6xfQqNl6ltnd+IZlim36Nty/mhdrEUVx3/PDZ8A1fP+hg54EY5U
         noFDf0e+C23AYpjSt422Us5kbcCHz5583/8SWhuYA2vtaz6IeUgBNVyZBVXMZtrs/As2
         LX4TgpqwdJYn4q2Ch6nU90byQdOhCSE1+bSozBeV6tyFiwBN/zdhps+vtg1mJxRvpVeZ
         HSQDWkSv4KUVWNrvDd6YDHbOe3QOX3tPtrz8aCYMCVo9tLQulH23ybhqLJZ5kAcTak5k
         x5Qvsy5h/mkoQy8qk69b949ho/SpTNj2Hi0gj4IaNMnUVPWSWFHQCQrtik06Xd4A8CFI
         7q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=97SWh4KjNEqT3PrLgTRSyFPPxyUwqaBsCIU8N1LHXrM=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=RiEYFYYrcD7Tkq2/ccKQ1873+2HQin7PRL88bzcoNtYInKAZWenmrC9gXhRbnVy0uu
         zSrzui5YcixR4dkUuLbvQ0Dd4sGC7gKvUsunk4nOorygoblsRHtQiTPiUjfWlzJK978k
         YxgI2t8mTlpbJMt6eD53K3X+qFfaAZUqibww8uOq1ZdBEU03qfieEsG73YPhVGZvJpWR
         30MApqXq+CRNzxn0liGRiOlqUK23OG5f7kiqt/uvy8ULzHGHTtBBUw4F+kF5U+Sqy79E
         TSb+O0WG2PnR1F4pZo8fc4Y4XXW71OSHX5Ulu/scnB2vetCPw4uk38SM24lWv/D3N/eq
         jYUg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780856612; x=1781461412; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=97SWh4KjNEqT3PrLgTRSyFPPxyUwqaBsCIU8N1LHXrM=;
        b=Yu6H89/kGdgY0blQunxCBM3ML+3FXZAekNf2EFG9Y4DVYv5Qyw6ZdV2hwwfKFTVDzF
         rDrtuiIgDuOoOJnsUAf3+UL8JoTGgPl4z7H86Df/jQxZOr2gG0aHIyRn5lIaD8QIH4EP
         68PkksasgqSwLGpLZS6kXQzhN3NT24Y3fLJaUZ1un/D7laPjOZ/YU3qRD+mQYAi9p45m
         h+OzU41zVllI6J01vziEdstnmjBV/31vky3cvC/8nwqMqzBlHly7LFjhlHn5xhdeeIZt
         qywVv/VcSoBS3zintT7uWdBhhr/+Bi6PWhchS66meqdYRcLOYfv7ohslSKbesFz0Shx8
         imJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780856612; x=1781461412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97SWh4KjNEqT3PrLgTRSyFPPxyUwqaBsCIU8N1LHXrM=;
        b=TTH+l7t3WqH8FD5W4pIv5JzAViHb8T/1vuWagLdR7SECpUZxkUkpZtlg213AxdfuPz
         rXmLvHIwRCgDpX5cXqxs2c6JXMj91PIGr+GOjbnu6F1rQKsUaokbztqaCAExW+gmfkL/
         BPU3T5s/MHI1YanLnP02+ooESnX4pnOb7LwS7GZf7gQzi61Tw7odd/TQjWHVaNYy4wQO
         lDeNEQsRJWoz3tm9mdLcxNVyS5yQxn27619O8cSxPAlux5NKae0FY0OhdHUhfjrVr14Z
         ichNRNOohcy245aFln9d2Hlwm4xjDjB95xqGLEYfJY1YB5chB/XLJ/7vUq4pAwT0j2zc
         gNiw==
X-Gm-Message-State: AOJu0YybB3oZEeEf+Tt24+7X54t36I7jCJDaewo9Ufyomt7vfTDxdeFL
	qc7hYcEtB5IptOjZS8Ujc3SNR43zE9m7/Z/yB8a+OXxeTg0cv8bNEqvOl5LcwD9Htmcw8M4ulON
	sNqGil9TV/Y3QVPJa+/GLglHr2XRSseovLuZHGGl0Vf0pRY5df6sVpTMcXf5Qtcjyore72a7xu0
	hr00+XAtd1ARmB7e8wIYAJdw4uB2l7K7Wbt/PfKg==
X-Gm-Gg: Acq92OGBtQ5u8YSPcLj8Ss+pucj9412N30DMmb/HPlcUTSX4Co0w0B2Anl5o37oKskd
	GKdqUPRRMoEPy1y7z9ItvH6EVCEtusjdq+YTQEC0fNGDrTxJFXw9/CC0xO3ijpbt+ZCswfeZ5ow
	X2tsi9BcDhU3r/m8og0L2MEtrnoJo0pyEEZaevI9aP19wG5km1S5CiJR1BQ2rHWIPRheU/kMOyw
	1KUiTOipIqAJDaGoXJyTTbltSg4ITD+RrhcBavD7gsNjEyqW/U=
X-Received: by 2002:a05:6a21:a94:b0:3b4:b259:6965 with SMTP id adf61e73a8af0-3b4ccd4c5d7mr14784341637.11.1780856611990;
        Sun, 07 Jun 2026 11:23:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:a94:b0:3b4:b259:6965 with SMTP id
 adf61e73a8af0-3b4ccd4c5d7mr14784311637.11.1780856611454; Sun, 07 Jun 2026
 11:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <8919e858-34ea-4085-9d5c-94c5c46a1bbd@oss.qualcomm.com>
In-Reply-To: <8919e858-34ea-4085-9d5c-94c5c46a1bbd@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 21:23:20 +0300
X-Gm-Features: AVVi8CfHu0g8IYLuyOcKd20fxUIXpDo1ngZRKBGGBmMd1Hh5_77qkZQ5pQkrAAM
Message-ID: <CAO9ioeURiDLw8oFNKdGg6KE3dB-NXsrkF+aqOXvcGvdyFRp4HA@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4NCBTYWx0ZWRfXyWzHaSYykHql
 47W+TQTTeqY83b7Z/xzHy4KAp+qefX8PdVDd22iWw4XU5o2jhzdn8ix9mLhRGj4e0ry6C1kLOjU
 6UFRoPfYeADRunM1SvGda8s+JZCMc3BE+4V4bkWFFtHcfXmjMVT/m38YoD2oOAV3FBAYWiS8nkw
 vJmbrs1SG+QDEOWg5m/9cQlLyx4Uta9K3mjtUJx/ybpp03WxucYrxRHRI7CmfCgU67ZOXIP5zUI
 oM0exOFY9NsuLj07rdlBIclz/WpV/Pzv8t7wD3skT93i/1XRdqem3eJdE39Sx1z+x0vSGDYBDJa
 ZyncRuQaFUzmUXMJ49JMGjF7i+qTuU2M2Yddg4XTsucAgCGJ8dukge4+YukdploGcB7IxIUQGY4
 o7YwORysWNE20NSBEX6IHEmhyVG8YyO8jmO789z/1LT3vmKZ/jbWYvg2c10MwDmKa+TbQ2CCTfP
 4FGSks0TlucJFl9av5A==
X-Proofpoint-ORIG-GUID: wuKk3ddV1K8cjc_brKQYsEWUsl15dfRr
X-Proofpoint-GUID: wuKk3ddV1K8cjc_brKQYsEWUsl15dfRr
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25b724 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=v8TkypfccKpmGX_Is-gA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070184

On Sun, 7 Jun 2026 at 20:17, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:
>
>    Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-lemans
>
> for you to fetch changes up to f29b7b531905b6da70f0a12e1f76f74f38fc6859:
>
>    qcom: Update DSP firmware for sa8775p platform (2026-06-07 22:43:35
> +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1083




-- 
With best wishes
Dmitry
