Return-Path: <SRS0=w3o5=A5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5CFD376A
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Feb 2026 16:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3346DC19422; Wed, 25 Feb 2026 16:38:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3497AC116D0
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 16:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3497AC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3DKl788938
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 16:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	If0MJfr5zA91ac2ZS03pEivjw6GPsuLzEa7w+vZV2Tw=; b=BbFpZPouW6eQnwSt
	eg//d0ethvUn5v5lEaYyUP9WK0cK6s/6pd6zkjDXJWmGOQdOayCAcVk4fxqNFexc
	Kb5I5eYjVQsaj3OQ1QLrxYc1r8NnJrT0tw5Ji0qIJaZPocn3cpO7EznhAW1tqJT5
	gNuxMQoyMcW12XnqR6+jtEWybyAuTQMLDeww3ifRTw6SQJc/pkZf37bJJCgl4Lrk
	8pnSRYOB1Z111RaGgduYXTpXnw3/jS9g3R6zdUt/sJuKXW06Yw6t3wMTlHJWqEfm
	huE9bCKFwlKHVzlz5fG01BLX4A5xV+SPDA0IW48rB8s8znyFl4QJGvbGZxdl6dIr
	IRqApw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9gyef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 16:38:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so6033493085a.1
        for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 08:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772037501; x=1772642301; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=If0MJfr5zA91ac2ZS03pEivjw6GPsuLzEa7w+vZV2Tw=;
        b=bljiTu37p+05w1cZOFSNHHN1iCy662uoW8gqTYmWedfD080NRIQApoSsJUgOWQ0nY1
         dil3NS3Nh1/kSmXtWN0tWIqbuW1pnF0FZhK/JTgfCqj/1TF+OilCYccC+uYR/aNKXiax
         rsK466+cwBOMCxctWvrMT37vkCuZKiuYr2dfU3v1OUCcrEfQXHAXzpWaE806ycUEaT/2
         cO26Qe0suktMxerjJTzA/8t2eFBxtPLf7aUTXcAanifpbtouwAbUCZbk4QpFyx/J5/35
         1Xz8M92GujTA+udhklzCtmpFRAX15DZgYXmmv7Rfi8G/S2J5nL4NIWxMrFV5YgzwMfCF
         xIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037501; x=1772642301;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=If0MJfr5zA91ac2ZS03pEivjw6GPsuLzEa7w+vZV2Tw=;
        b=ryuIBJqHASBdr0gvhlYMbX7jWXnC7ORLzpdXV8LWECdTrEOoxjZJyCwzn0KRXBxR5r
         dUPR18dhI4c0S5k7XmHBO5n6kOvguv3TF2+iWh81QjUExDvZK6Vc1Ye+g38YUX93YZ1H
         z6lfoBPHJTT5L6+xsvC+B9XMMYFobX4WYTnZ422GbyhgDGEhr3VScgEGhNYQ4W3I/TNy
         aIxdbtmxc0Yui6/MLHg3gvCq1U3GKLLY+yNWVlZ+8jAHoVHbPMVtuj229LRwXVzvmXGp
         0sXY1r9+OT9wlraFrCfSPaCByqFZw62JXoEWyQdsJhxTn1xBr9NeDbyLdSDhm5Kvf7Td
         auvw==
X-Forwarded-Encrypted: i=1; AJvYcCX/tuaY0uREIpuwhRa21XV1UdzAE2pBe1Cft7FZNnctFbv4JZXZYsVxZiFBopP4fJ8F4qaDFWQIy9RUfKXLMg==@kernel.org
X-Gm-Message-State: AOJu0YyGdTcvsc/0fLI/A4iFOpNp3VyDYuPCNoQZkwhTv9waTr98XN9q
	ROvkPUK1HGJj61tloFi4k0hdAup4rNQCSANvu9KzrCvLLmlynvOAMnRIwSwkgiJTQNCkfFVAuvQ
	/pfFWkpqnNWbC1g5sYp443rc3MwLgdPANWQsVC7WkyXrntXqoYIuSSLIBLuz/7as=
X-Gm-Gg: ATEYQzxXDVe5CeTdGiTviyHr/c8sHq3sjNeBxaCmCiCK3GednzfNoSitJje2NW7ZFCI
	ZwXjOkBEEovoj2WpGYfbbKGBabCFercEzQE+nTiDvrL8IrX9Km3kFRwTRSP8E0WM5FttoOIsBAv
	T8wYs+XwJfOu3Vywj1o+Moj3ENZygquJxN2mkYFu4XkAA84aCxJ5T/urW9JC4iT/USt1HEeZHnq
	R6SVcL4DLVUVzi8HeDr4adV1yHmdBR9V8ix3nxU0GoL3D+/WHhfnxVX6Fo4+/2dFUV9u/UHWo4r
	+byHMza/+yBWQ4rsKEnmAWzSPYdjnvQXguJZz+4nOSYsD19PQayz9+RWh+Y9nI2ErqUiieEu5UG
	qkYgzZx9AxpAY2EMzKVkoH7rSv1y9Vp46/0rtE8sDdPbO/LsRY003p0gtE4hIwhA3i/DK7j8Xde
	aNZW1shtCoSiFTwT5vfYAaT0aPDvP6VM1WbH8=
X-Received: by 2002:a05:620a:4692:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8cb8c9e6562mr1913151285a.8.1772037500930;
        Wed, 25 Feb 2026 08:38:20 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8cb8c9e6562mr1913146785a.8.1772037500358;
        Wed, 25 Feb 2026 08:38:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0ff3241dbsm756737e87.68.2026.02.25.08.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:38:19 -0800 (PST)
Date: Wed, 25 Feb 2026 18:38:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Zhu <xmzhu@lontium.corp-partner.google.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vishnu Saini <vishnu.saini@oss.qualcomm.com>, linux-firmware@kernel.org,
        Tony <syyang@lontium.com>, prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH v2] linux-firmware: add firmware for Lontium LT8713SX DP
 hub
Message-ID: <libgdoisf2pawl4ggnxxrr7sks3bcael6f5ix2ytrhvqsqauw5@vl23g3wi4xj3>
References: <20260224-lt8713sx_firmware-v2-1-8aa80156b88b@oss.qualcomm.com>
 <vfhlpudqtpwaccavyjgqhqb4grl7vxdkzdyp4xwzafvujak72d@mfeczqa5h4iy>
 <CAC7NNnoYY1=NbdomzEH=ajiBO7XikeNmR3D3LCSVZsAPxEkr_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC7NNnoYY1=NbdomzEH=ajiBO7XikeNmR3D3LCSVZsAPxEkr_Q@mail.gmail.com>
X-Proofpoint-ORIG-GUID: mytdEGBSUeInFysuKDjK-pkY1A9fazWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE1OSBTYWx0ZWRfXzIV5s8rWHIyu
 ld0PmueW3YRZ6ODb3L/t43gN2VlsASsRAMU115H//ZOFf8U9LhzeQu8ZyKU5pPQQ93as874C6bk
 7QBsTeOb+010zEXedTZ7QnEQry0Q8Pi/H2O06wPxWd5xAwPKfzpf+D/qZQLc1MmrGKv02W+R6vP
 nZfzJ4U4UxW+Pwlq7ifMFKu6SSgElM+EEMeXXE1VJr8bXZiy57m4n1nRdTkkNV1ElLDaBdSJmpZ
 HJOLCOUms7QxpPiKulwlBymFql2P8OzFH/06IxEc8ALJeBeDb9z2NcW9cekoENeQ13+31chFSO4
 2WrzkdlWH6+NmqBM0ZWE3tw+wab33m/cAhSVYg58Jp3I2bynftVUp5y4JY6n8D81skh8eevFbiW
 2N2H1CL5tl7LavIdeNiDCoI5oNofIwsfToW937jP77H5TcZr6J6dJJ1yNrGOk4+Fpymluz13AP6
 aMiotLOkeJ8LBALgc5Q==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699f257d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=UWTAPIwBNA3AShhRI1kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mytdEGBSUeInFysuKDjK-pkY1A9fazWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250159

On Wed, Feb 25, 2026 at 09:12:59AM +0800, Simon Zhu wrote:
> On Wed, Feb 25, 2026 at 2:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Feb 24, 2026 at 11:42:49PM +0530, Vishnu Saini wrote:
> > > Add firmware V667 provided by Lontium themselves.
> > >
> > > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > > Cc: 朱晓明 <xmzhu@lontium.corp-partner.google.com>
> > > ---
> > > This patch adds LT8713SX firmware provided by Lontium.
> > > ---
> > > Changes in v2:
> > > - Added Lontium in Cc to confirm License and binary version
> >
> > It doesn't confirm anything. An email from Lontium will confirm it.
> >
> 
> This firmware was provided by Lontium for our partners to use.

And Lontium is fine with this firmware being a part of the
linux-firmware (and thus most of Linux distributions) under the terms
specified in the file [1]

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/raw/main/LICENSE.Lontium?ref_type=heads

> 
> > > - Link to v1: https://lore.kernel.org/r/20260217-lt8713sx_firmware-v1-1-f78b85fceb63@oss.qualcomm.com
> > > ---
> > >  WHENCE          |   8 ++++++++
> > >  lt8713sx_fw.bin | Bin 0 -> 145976 bytes
> > >  2 files changed, 8 insertions(+)
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
