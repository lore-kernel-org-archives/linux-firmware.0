Return-Path: <SRS0=k++I=AX=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60818E9A03B
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Feb 2026 06:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47703C19421; Thu, 19 Feb 2026 06:16:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44421C4CEF7
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 06:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44421C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INpZR92883165
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 06:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f2JQ/54pSXy72TFSYKQb39ev
	HfXG8Lk1QYOhzCbRfQ0=; b=Z+Wk+2jAD89RsEBdZPVxwvta9WbQbQVcMaL2BRN2
	CgHbY2zpGB/SiQ9YRfdX6eSsQzY3LGo4KVAKpQS1GEThOllgUV7xMQh6PuKxMQsz
	EYzg4S8AM5zT+5q0nuf4jQFB16zYbCQdpl1EWXzVg1JwyijAcaQvSXrITpp6sNfl
	eYbjIzZGd1N/1hbgIXNd7aFrrQSFMIuAelLZlNHwUk0kVTyFAiH1eYBsQMjmOBac
	vPeo+Cla1iBIYMExs8OPItP3RsKqm2kh4xAkPmpF644fDNY+ed9B2Ym27vOwU+zc
	Nyj6Egcrq+0FTpZyG1BEn8SdbySt4RGhuZJS5mzBqjHf2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg8n1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 19 Feb 2026 06:16:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c71655aa11so621847785a.3
        for <linux-firmware@kernel.org>; Wed, 18 Feb 2026 22:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771481780; x=1772086580; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2JQ/54pSXy72TFSYKQb39evHfXG8Lk1QYOhzCbRfQ0=;
        b=jnpRlTDdDckr2MNbGsdbS3fBe0pH8ddNqV9neilpvReZaUHjdk9UcDDixcFqR6Ch1Z
         64fsU507XpJtoLQ2LieNh3dFeuxqCAGx+JXTCeqMLVVSQksdgQz9Z9CvPRsAHhwxWlF6
         nMwZ0JAFIWFHI/jyaXqbzq3nCWu4GjDdxWIlVsZ4VbKoQKZbmlpIG6CQSv/EKLxwn5mj
         4kQikZVVYH6w0LOkGRjAwpR5D3hyxCl2CX+V8lR/PCcg04lOfiRMGvmZqTWd5Hx8cKlN
         NhuX5l9cILLyPM/ua5X/gl7BUQgn9tmCOFn8DPVA2EtBoiLD95odIfqcz0bGLXm400H4
         XxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771481780; x=1772086580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2JQ/54pSXy72TFSYKQb39evHfXG8Lk1QYOhzCbRfQ0=;
        b=pplKLhAI/xHpKpJ7klWBuzU27TdPO9KEIFNWw/CMW+djMwhGJWDw2fQ9BHcIPb39kq
         q03g1qIxdjk+0kZ8kYAgAoi6G9t0bmSWfbv0wAnA9n9Eu8aJ1mhT4p+1EkWtg+H9m25o
         wwIYMVah+v7hAhDj/T+PyQ1UFRBWQ9qGopfVHtZDLOI+QflzFeShnMtrIvj7lsOIBnhu
         CWQJ2hCJLmj9ea3z7YLJWvPWkUXQ0teaii3ZPyiAkxZpXciDo48LtbJ6faDjWbUL8ukG
         wbUcs4etLLnFVm2N9k3fuoGQRq8zTXFgCn42qepTU1jeuxVvAfFPp5kcQrOkxg4mF0Vj
         ojnQ==
X-Gm-Message-State: AOJu0YzRgo5EnTc5XZSpu4PvODBBdj527PzMbda2kRewheiLnZU2Vw5V
	H+e+4Q2pzJxcL4jAv56apDjZcTQR/TvLdxriET0LOP3hgaFAZZn2LuP7djZXCWgFQnXrcJwxwxm
	I9f2IJuTiLOsbl29PSBqPV7+DXRzJw7TmcHYF1pkiu+PhjXw1bXFbs9QcP39yra0=
X-Gm-Gg: AZuq6aK/gtxx1JGPNMRDXAtRjWOIBDKO6CeHYCpYHjWDCgQuN/ZOx4fB0M0dG1L3Iwh
	ikm/4IagzivIbNH7tjWoNOJWAgL1jpaEV6DHtAljz/FgFO4gpe9znJrfLVNJfAg78kJGw7iUBld
	FYwKQHCu92dk1DS6WNUq1OMlHCERhfA8Dzhm42sHcEjo5ismTNOdWZdWnyZCgbmdPgpOOgd6Elu
	hfBswddCKTRz6CorXzvAPDHtaCcH8i9X8SMsA7coOjFn8EMI9bPzelt53PHR7X/1VyIa30vgKao
	0uwxaojBTWdASowfC8nQsjbTEeyFMqNe2N/bzYGPuTW1wVdqcgh/eyLTFoIW62AX/+NiFcmWf+D
	p5d8lLLIsvCMvVH77HQf1Qp/YCIUpiWkUodgEfPObETjFKkGfoRvW9Hl/nBskPltOPOXeBwsn9c
	cwUOrBInUVLKPnbu1dGloUFLy8FfABOqofXk8=
X-Received: by 2002:a05:620a:460c:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb740ef342mr495493685a.73.1771481780098;
        Wed, 18 Feb 2026 22:16:20 -0800 (PST)
X-Received: by 2002:a05:620a:460c:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cb740ef342mr495492485a.73.1771481779602;
        Wed, 18 Feb 2026 22:16:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568bb7sm5134230e87.25.2026.02.18.22.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:16:18 -0800 (PST)
Date: Thu, 19 Feb 2026 08:16:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: qcom: vpu: Add video firmware Gen2 binary for SC7280
Message-ID: <4gw7ghocmugk7w7urjat2kfsragtqvtq2obnxaq7buibnktbho@o2jkqxbfutpu>
References: <fbc5562b-6b15-141f-0039-6c1a5931d555@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbc5562b-6b15-141f-0039-6c1a5931d555@oss.qualcomm.com>
X-Proofpoint-GUID: L_Uu8Gus7eSoHfsYIHujk9TEwH_GSqVr
X-Proofpoint-ORIG-GUID: L_Uu8Gus7eSoHfsYIHujk9TEwH_GSqVr
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996aab4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=F3JgQbRBOCNHi9vc1g0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA1NSBTYWx0ZWRfX27ML9/Sr0HCu
 RmeYwr+8XQ8dClg7NTIt+Ntc7PhAFp0Oe0Uttyc39EeWMZBzWelXY6jMh5tcfnEs9qvB4i4exXv
 n1NVfiLeMbZyeRqJpkG8XX3k7N9E7oMaGSS1HglyAM3izutP1Uy31Wqr6+rSP/8iMQ/F5L6V14K
 fupi31fwzY+4DZSS/g8tLHqwGGBjVjS6rNKfeEi8DnRrZuLYGE8x55KrO6Xf815IZLeMshoZuqT
 AwCYdG8rKD+j1rH+Q+X0FEUHGbpk5QfsNgZuBTiAkm+V1+YhnzRhkTTE4rSfK15snr7mjdguMBw
 LmVC5O8ax9GSYfDhrD7WI6UzSOEawhakOUw5hWjpVLU5/EVSXL6LeCjhthy6mdpYs3ZnKoat7rz
 le9WydbVT0WaelgJ6vyDzETG1DE/hMP1L8WS37AZ091/aQf9o2QiX4StHLGsfwlYDB67ZIB8+iZ
 OEb1j9C7E2lO3F+nXJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_01,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190055

On Thu, Feb 19, 2026 at 11:09:29AM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:
> 
>   Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-kodiak-gen2
> 
> for you to fetch changes up to 3da84f1b4bb062f18d7f08807beeb46328e06d46:
> 
>   qcom vpu: Add video firmware Gen2 binary for SC7280 (2026-02-19 11:01:56
> +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom vpu: Add video firmware Gen2 binary for SC7280
> 
>  WHENCE                        |   4 ++++
>  qcom/vpu/vpu20_p1_s6_gen2.mbn | Bin 0 -> 2030620 bytes

What is the difference from the existing qcom/vpu/vpu20_p1_gen2.mbn?
Why did you use a different name for the binary? Why are we not
providing the backwards compatibility with the previous name?

Granted your comment on the previous binary, was it actually tested?


>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/vpu20_p1_s6_gen2.mbn
> 
> Thanks,
> Dikshita

-- 
With best wishes
Dmitry
