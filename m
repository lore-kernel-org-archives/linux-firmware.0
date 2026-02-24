Return-Path: <SRS0=ljtV=A4=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47457F4BB73
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Feb 2026 18:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CFDAC19423; Tue, 24 Feb 2026 18:51:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31542C19422
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31542C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIGCFg3333590
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5WIenIqKGqO/mZpTvh85ef7eFz747ti06YF//ctCMA=; b=BaD3rMdKTeZsK2jd
	tISZEg6ZbtBJQ+ONdAHcniBaMm5vHs0YzjauhRgE8K6u8QKJsnwin4WuyB7m0h1h
	FIGcNgcDfavga3xtSSWl2Y2oG1oPauqLmFrzOi8ONu5iuB1w7dSEPfkR+BJhxIJz
	Mq83PwwLGnVe/Bc9qT/Rs/KhBIdcdQfhq4S5lAcJncRSuY8MNWTTqfjzU43EnYS2
	SXgph2XIvaj3YmY9JsIexjg5Rzfxn4Yf+Yr5jcbJEfOlct0R12YTAzFjRE3H9sxO
	Ws/c+C8lZuycxo78wB85tuqYPzEvvGkon38Hn/WsgqnXpBAOxL1lvHfqVZ6p93kN
	pVkxPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh4703ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 18:51:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so4674401685a.0
        for <linux-firmware@kernel.org>; Tue, 24 Feb 2026 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771959111; x=1772563911; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5WIenIqKGqO/mZpTvh85ef7eFz747ti06YF//ctCMA=;
        b=Avg9FvyDUjGfGzWe4GcdKKHHhOkIYzD2ha/WFTUGxmZnUf+2glv1BsgUW+dZODVfl8
         weoZZNXcGzbd+GrkfLnUMbA11ig/BJvesmwcmp34VfFSui1WDQut1su95UU1TRnqd7Gl
         LJvNlJlY4NYsCoC7cnE3YAqrTHdAtSYrQ1QpFZb3fr7I/jJrg+P5QsT+EysNaNRSm+AH
         4azpZzbCxm2+q4MbIxe+TgDq83gmJdrApnxdRYQ+h1O26mUzQbu5i1YaQiY89z6bYlvi
         SJZk9fnlzYh0LYAi4G59tH0RvFYJhytJAXX5J2EKgoV2zXFp2rGOlrb+cys9nCMam4r1
         ppMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959111; x=1772563911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5WIenIqKGqO/mZpTvh85ef7eFz747ti06YF//ctCMA=;
        b=GhttmF3DGLB++7LndF4t83+RK74EkSupedboBxWkEpEo7AQFvKx8hR+fSwVniYoD/W
         s5OpLsh+YRWwnD0kTqFYDdlCVfFQzAZbD4zHdMj2gbScu6k4WE+Idbc4n8AiPwhmq+Ui
         zbX4SdlQYjnhtklp5v1RIlSl52Nn7HfGEIdBGNazkO6uylivoFzxFwIGB0dBmL4zl+EE
         TnDjYn6ZFU6j+xDraiCKl/ipvLKALK61Bzqcl53SPiCQv1RwmJ2ruVZwo/GoaP5NQxfj
         ZhmKPG7osMzJnwtmnzjMnDvxGCL30lukqqeF/xJnoPGh/8+bUUkT48AcsfhAkpj16XKc
         N+2Q==
X-Gm-Message-State: AOJu0YyUzIpyTKZjOjMpQhvq9WHPyPW+E1NtNXNJObUS9F8bzvJq5QMT
	LdS1XAMWODDndVq8EHbHJqCjJtJQuja08m2xHTm/iKEtQ0ViZIVggW62nEbAWbbuM9rXEuzuSCh
	BWFvFfyPHhar6gjuFcLXroK9sJJeqCoApNfQR9F8GibZ0lwn95inpaPLvX4afJLc=
X-Gm-Gg: AZuq6aL2ljWU88fFop9StQJvjhsGSfAhaeRi7RwP/PJOcZS9vwemiWh3u3PD0uLGagF
	l/WeP+u7CuSFMNic6h0z2hscy1Whu9oOF3nCuOPRcjpBpilp1KdhCAYBHKx6p+XVRlI3ZYVta8u
	EN2SPbEDm1wqp2KNelt8EYynBkUprARdQFKt73VjFT6xbwivGJtE+0AQfQdWY6rz4fmz83QdWCK
	IYADncC2mDLldT4p4uTmO3l6UHPgOZ3PMM9hxkG8RTiMDCSAHbkGy0A1lNZthSrZqEqj+PvsfBF
	YMHMY92WZIovGZosqzS0FJb74wgoxOS6qabdPgnArTw4Vn5LK3y55MaRvaguwUDj+ljQEl7jB0h
	VvfBxqiOGh9NUdrH+xnKfnNpzXTJt5WSGLSADcPqZWtVnjmYNKf55jCuRn0oIUtCElKLG5zVLsw
	X5uSvtdA/bqnaQkE8BH07r8M5GJId/dNJWwKI=
X-Received: by 2002:a05:620a:269a:b0:8c9:fb65:7f08 with SMTP id af79cd13be357-8cb8ca63f57mr1676356085a.46.1771959111283;
        Tue, 24 Feb 2026 10:51:51 -0800 (PST)
X-Received: by 2002:a05:620a:269a:b0:8c9:fb65:7f08 with SMTP id af79cd13be357-8cb8ca63f57mr1676352885a.46.1771959110832;
        Tue, 24 Feb 2026 10:51:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b930sm2423263e87.5.2026.02.24.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 10:51:50 -0800 (PST)
Date: Tue, 24 Feb 2026 20:51:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Tony <syyang@lontium.com>,
        =?utf-8?B?5pyx5pmT5piO?= <xmzhu@lontium.corp-partner.google.com>,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP
 hub
Message-ID: <hxfpevfauiif5zinrihoq4qleuk4shvxvkqlfmrdjmblgpjncl@6yq44r6daeat>
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
 <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
X-Proofpoint-ORIG-GUID: x_JISx3oB1A3DGt7A470y2jamV_Ix8We
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE2MSBTYWx0ZWRfXxFt4jcnkIzjw
 7mIfF906BdvIeRa7FSDFUwbWVV60fd4X6PdcLMNUQv65aS0t6Os1fSiPsHPSMzM06d8nb4GzNhC
 MI7v54c+uB15Yqyz/MWieK+cSV8w/sU4ChI4np4efnQ2SxlIDaPujs7+2JJ1lqi0CRLp1CxTUNR
 UhryDP6DhnzGnz7dP9NlQHpu+2eW8VQtEtR32G7IKE2svoC2zTqja0qDxn6s8wyZTmVGaH6OUYG
 +6l2gnK4R/vtdxT85TCL7uBQZe4XPLUsKwObRw1hdjPJlJYZYqpqfLT7r/iAsDzlUXoIQ7oYM5v
 LOavCtYc5ZNj4QxwVE3wBKwHGioGjyCOGYGpCt+c7rSlxgDcGtI8TjMBj23BLIS3VRMdcwhmBkP
 b5YsI3lPoH1D1wtmcfA7pqccrmB/cnm3KXVSgHrTyoq84iwZK+2/MiOTDUmxTAwmTs8VWi0uw98
 HUMLCu6PJ1uinoo1KWg==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699df348 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=u9u88KQiysVh9alcePMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: x_JISx3oB1A3DGt7A470y2jamV_Ix8We
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240161

On Tue, Feb 24, 2026 at 08:33:25PM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> > Add firmware V667 provided by Lontium themselves.
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> > ---
> > This patch adds LT8713SX firmware provided by Lontium.
> > ---
> > Changes in v2:
> > - Added Lontium in Cc to confirm License and binary version
> 
> It doesn't confirm anything. An email from Lontium will confirm it.

And I'm sorry if I wasn't clear: it can be a reply to this email (or to
a previous patch version FWIW).


-- 
With best wishes
Dmitry
