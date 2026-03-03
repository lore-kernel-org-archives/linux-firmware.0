Return-Path: <SRS0=M+PL=BD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2FCEC1447
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 13:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93D16C19422; Tue,  3 Mar 2026 13:34:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5ABAC116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 13:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5ABAC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mnTV3995369
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 13:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwVEWH2pgwAoh78sE2KEG2EwLnY10RepQ6eLjGvgO/g=; b=hFrjEsoj1UzNNEi3
	4zdiN6eOGB7pkcBeJRyvdTdR5NpocVTcF3ZyqONDWUk/ZVpX4PDdBJDmMC+JGB3e
	rruteBhXOt1vES6MSuIoaLJ4PIS5aIEY4M4X4zyZzeQfQ0nwuhqV3F7OGXbiFn9Y
	WjoqGFBci+Q6be1aO+6DjTOTnh49G1Ai2KMSrMYH/ioLo9UQhcDD/33aDzWKn1Uf
	SV7bShB/yo4/IwlOl5o3QrLySw994XH37k2g5Z1HJUtyRc4Uz4N3EQO1oECW8Um0
	CRl82hxYJQGWdUdA+vELuG1iRQhEQ9xPwijmh9ZEEO+lIS/qG/BUZJb4lS+StHP6
	ny79Wg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fskrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 13:34:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a116bf0f8so16615746d6.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772544853; x=1773149653; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwVEWH2pgwAoh78sE2KEG2EwLnY10RepQ6eLjGvgO/g=;
        b=CcH3P/Bp/vdgGvQH3UAzZ4UmbNCF4Mt2mRfwRGZSfGKG9QO/4MiWHuVF4gIPodWOKI
         hYCyYvM4aE1jIGu01xkM3T83E8ySl8kjJ4jpQ8svwfZU+Ng/Ll/zk9BQFmt8Dw4CXDw1
         nMGU/soNx9jIJXqYXblZzoMiECbXuVahlKJFM9s2LEKjwOFA12UZhj9UsaN2PzKs75CT
         Gh0fdItTLYKJ202Snv3wJKWnLILUrj03efk1tzqDopoqmAm4pL0q9dYvHVjRA6QsqIa/
         gJ2bMXIaTVYu1x+i8jB5r0UvqvMftFAT+/BnqCH5kxeHb6RGFziOwNLcI89l0egEW1rS
         aifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544853; x=1773149653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwVEWH2pgwAoh78sE2KEG2EwLnY10RepQ6eLjGvgO/g=;
        b=pYEtNAjhwqquB1VqRKcCzv1Z5++Xhhm1ZjkYK4ny1gJxYoHCMDw6Q8H2TJMxKeyBiT
         5ZpSRKqDxztDTd38+JcGVjhXecrWf3uSvNTKw0gr0yPyReKzMul2lfGyNSQqh1rGv2So
         wdV63k0qxPn5lTsgVo0/ONdbxjzLb5TE3NsytzrUTK45vXuQRvZLoJaUGvIDEm9k9FhV
         yMsntbNvUE6nPpeNrD8qhDqpn/cv9YlXgg8v0OD8ikI1ubSne444UDgrHNSsaH16376P
         wzAW/vSkhaQadzF6YPvzVp/LgsCxOWsRPfTYt++zapFXL14pITSoaiAQHju1leh7sRcP
         TsTg==
X-Gm-Message-State: AOJu0Yxcr8sGv1lv6ve86sOz76ckteZCch891MS4I3OjogZosUR4bKKZ
	uxoUf1NpKd+hScauzBXFDRiaA7yCXksYpBg1pXPn76xzuUe5v5msKbM+Cy6sy676MBD5SVkrvXT
	kQufF8Gts5Dd3LlM6WaU3PZJ+XRhZA4peXbsz07rq4fTqItta6l3uRldVa7cH+OI=
X-Gm-Gg: ATEYQzw3WfSwMpp/BNAw+85qLflg9lGY6yUy2AQJYRAqoOaY9GcO7s/M8pX3MSTALoD
	ofSzVdG5uvtJBp7i/ojtHDmFPduWEYSiW/ROmNhkr9eYi0NG8VavwDWT0cvgVhDYm5Hyh9dAJse
	tOzAbHqtHoJ3MunUPAbF85sa97/lH+1g3sXw0eXzYJriJPgNxhjb/UHDG17+5xVkBPSkMDS0rGb
	ogopwko7sTbSFBn0RCoRAYg+hpxw+BHIMQoqhvvJThcnfaRnhC9u/6QsRQH1DZwksPXfBG+eWgR
	9WGW+WoqlE86Ym+8Fmk1y9o37el44Pm6sXH9Fow1oACLGkKZSdPpnfnZtt1pVQkhDOek1oZPACK
	GLi4vfabLOHCKZReiRT9f0Ap5PHKox6c2hOAOM1KAwsGHlyPWPqrILo9ABfgT/P2KI/6jZhGlHq
	kvMG6pzJPP5gO0UzAucBHGcNy6Ney4x09NURQ=
X-Received: by 2002:a05:620a:28c6:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cbc8df6d4amr1972242985a.42.1772544852511;
        Tue, 03 Mar 2026 05:34:12 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cbc8df6d4amr1972239585a.42.1772544852017;
        Tue, 03 Mar 2026 05:34:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123578829sm573642e87.61.2026.03.03.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:34:11 -0800 (PST)
Date: Tue, 3 Mar 2026 15:34:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for glymur platform
Message-ID: <h4kip6422xbuexmylomujmk6zzoipkcbi74vf2ypx22rzpirhw@v5yhnwqpcg65>
References: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
 <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
 <4c6945ef-e5c2-4d35-9be6-a304c66f7043@oss.qualcomm.com>
 <7mbt2k3gqhxs45l527miwjz4b7zrqegjmlhyi64i62uombffab@4nua6tiy7usu>
 <9428baf8-93d0-4908-9808-d60033a5d894@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9428baf8-93d0-4908-9808-d60033a5d894@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6e355 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=aLFgTUHBjtJXfJrlVvsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: oKfpy3G136znnnympXPbiYYZchRZhaS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfX/430cM1YvU+W
 TMACGKl/soIdXFOgE4fJCDTZNGaXeZQ1K9M2MgsqDL8XHVqTPp8Y9HmtG2noakZbLU7+DgIyJiM
 pbYTYSctb61Vmnr8OH5wWWi5RRbou7MzXNd63FPbTTzvEs+w58iuOdxTc+7t+HwHoJqTLIK9L0Q
 fTZYkvUf2jUHchzvTQMjNVt/UXByzNedFACsIbJoRoRcGOYCoreLD7/RlgHOBkqGDj1yNRN+k7x
 TFd2rRmyO233ecw4bcNvAao7nQ9RTcs9zyh95vx28jrYbYNypqcTSR9NSmB+HJo4Lo/pMRolaH3
 co839ZBhN5CIEDUmt6r8WDzMdDXShweVpc4nxW4gIrP9zk05BgqiGGm+FXhw7DOQOCtoxLGD3AK
 fxd5ZNCjxzUzV9a15yWY309mSnAE2YyizkoGsTA0x8w2yoBG5hbt5ca2SztSBd2rXkSU8PL4mE1
 fuP0sQM6kTwITBYtTJg==
X-Proofpoint-GUID: oKfpy3G136znnnympXPbiYYZchRZhaS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030107

On Tue, Mar 03, 2026 at 09:29:55AM +0530, Saddam Patan wrote:
> updated commit message.

Please send a new pull request. And don't top-post.

> 
> On 3/2/2026 4:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 02:02:08PM +0530, Saddam Patan wrote:
> > > We observed a bootup failure in Glymur caused by a corrupted adsp_dtb.mbn
> > > file. The corruption occurred during the ELF → MBN rename process while
> > > upstreaming. This PR includes the corrected adsp_dtb.mbn to resolve the
> > > issue
> > > On 3/2/2026 12:38 PM, Dmitry Baryshkov wrote:
> > > > Missing commit message. Please explain, what is going on, why you are
> > > > updating only the dtb.mbn file.
> > > 
> > 
> > Let me reiterate my first phrase: "Missing commit message".
> > 
> 

-- 
With best wishes
Dmitry
