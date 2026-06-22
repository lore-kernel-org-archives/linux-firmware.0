Return-Path: <SRS0=CvfH=ES=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5AACDB46F
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 11:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47AB31F000E9; Mon, 22 Jun 2026 11:22:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782127321;
	b=Dt7bxnseeAr1TXkxP2BVZnskJIz7Uxhy6d6mOKSON5zrfehIP+oxoh9PbeBEXw5wk+JJ
	 ay2eZpSsny4FTyYsD9x/G8b4sh5OZcC7QWWkzFG8kBhxV2Hm76pqmVWMBWzDomyrOq0Sb
	 oDJYPPc7kXazaSWzig3pvZhwkyMYPsKm2o/iyeQJQc3YY86IFtAatT44XHlUtEQOgdWeA
	 vx1DUhcuISTVRYo2QaY21LgG0eWqlz/td6mq2D1DEOUadhuSRcU4hUa8iSwZk9kPhvvn5
	 slNCSvUCCvYruzS8/JzgJ0q4aaWQjbCgwRTWiTZmXRpw6xuxWSnz3VKGQmiHjgZ1SyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782127321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2sr1dBOJO6rIzPhYDNg30RxFxrwPmX1i8Xigvv8Q2SM=;
	b=AQznUabO6vEydghYeIC9FmeSWR9+VCvd+7w8h9HUPpSt7dWVzWL+nkycLkHbN6ejv5ZV
	 TPiDubkTVyelqg011yNU33mNt1l3i2Zq7E+1cx+uP/8802JOZzpUCDZ/yroYYFCB98yS5
	 uCX8EQVGVAiWEIAP2n83+yoEsB30p0vCxOvH9Kc9pmaOD4lzGCQhaaJFVpVqs70VR0l+H
	 NIsxZjuy21Q2nqSMGX+WhccC8wLGYgctYO14VYr41a7JecDyUYh7fcrKs4ar99Y6BqU6A
	 hNxOCyyF1HBnqwHAPe/bfA2U6dNgbrbklhPVn23J/eqATNxzsdvgEXj8iHE+CaqTKIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tk8YTZMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEmV5psB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54F8D1F00A3A
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:22:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tk8YTZMD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEmV5psB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 54F8D1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoGNI941150
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2sr1dBOJO6rIzPhYDNg30RxF
	xrwPmX1i8Xigvv8Q2SM=; b=Tk8YTZMDXmaEZGCozkb5gydLGXO0c1Sk+CszwusC
	XFm15p+jIwCllLmMkXhh+7S4UUjK+MoIJSjcAH8wHf4V43ZTPZx/9v278Ev8TEbj
	3axR3oWeJO+oZMPNUDrlG+496Szomi9leyKS09/taBSsb00W+TtoogVuip6IwWW6
	vJ//8NEzynIQ8GFihhPTaco/GBZgdN5WAIIYfaFiJXhL9EftroRrmt4svkV1Gh6A
	oSZZ7FS7EUtGjkJ4+wAIbffF6Bs6L1y8iMM/0oAN5w+ggEWXeg8xXGyktuMuLarg
	ByHMfLyCmr0Bhk9D5qYnjUvNDjoelKCcyV+zgT0zWtdd8w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb84ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:21:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso7340456e0c.2
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782127318; x=1782732118; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sr1dBOJO6rIzPhYDNg30RxFxrwPmX1i8Xigvv8Q2SM=;
        b=UEmV5psBiPfWNzx2tzXXO2f18wHT5juomSJLswz1IFEnS+pr9v4Litg3+mrD2IIX3w
         YpZTR2GHH+QocoFIKn5ZrPrGMBURvzck6aqibLrUI1bjtM/ikp7ue+tKeqZgkdeTuGJN
         v3eBz6w8cVTyTlxAPdF9I/RdbwC0vDrkEmcfkv/brjYlwA6mVjYMRGrbPLIxYC8Mq3DU
         /ypD2+GeQ7gWg59VhDgDVaM3ksuUICrU0TjZ62mwpDOxnGmEs39MlJ21tJTtBn/dubNO
         A3Zimcc2lTCefGwP8d3IO7Wam5Q2XuL3NEx80wQr4+rpKkTOs7/cmQW1rmee1wu0JohN
         jRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782127318; x=1782732118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sr1dBOJO6rIzPhYDNg30RxFxrwPmX1i8Xigvv8Q2SM=;
        b=KqLfMD/dcwHfPKJTEB8EXsXK7yuoF0IEosPnRbSQwXWP0hbg0WEG+uUs2HV7BXYoSH
         UV8iA32tdQOcVHUjinj5bj7NFClXktv1/5EFDTrgK1BSZLGNoG23s19b3V6+mYLvQ39J
         mEQ3GTOo4T08Wp8YzR8MB3TkO24sP2vN+vYM5PDU3GPKJwmZIX+FlH0yLdGsupij6OFW
         W78bG/i4UOASCwJLdH150z2yeXBcPeGyNtHJ9nAt1y1F/m0i3lFzIVYlWK3yZ6VmoyED
         6MgMb1QchlTkG3AbnuxdPkCzghdHrO/AXvGkCNzI82jwQc9r68VM0Glv1+bpr50NAE1L
         /VgA==
X-Gm-Message-State: AOJu0Yycteq0llToo5cGY0o3Z2sqAkVS3YiL39Ey1M8I19dU9omBFSaY
	Arh2sLIRBF/6EIpg3oDtg7KYSAMpTTnHA7jO5lOTjdqY3jWmkMDlvJrLa9pRx2KGDDrMjgMEZv0
	B80ZvSjZYAtfCc9yYl8k3vgeu/H3RPJ6woJdz9hZGSh60tiRD98kG49sqfmj5YYYlo3pAUJY=
X-Gm-Gg: AfdE7cmlUWSbkz5TJijW7Yen8gxXTKnoyHBool2q3Tc/YOVWgaLH6JQXoj0ndjiKRBi
	3cQHIc4kw86BifLOcNVU4ixUhGSSzPL9OUn+mhrOHxkhq5SOQEPGs+UgXzD5/AIOjplfXsmD/UL
	n6P2UKH8ZprN4pYXjwd43eS1fPJcp1kXx7AB0BnDmSL7Re+5Fm08lDmii5VafBlGhFLqxt6nFt5
	3gtSB9xhRZjVpTIhZ2xNclwTyTnQ63Bd/H1HJRUmUN/H0zLaRFILDFDmSs0OEhs5QIp6P0EOrw9
	mJbmiUYaUpBf7x2+bELvpEz/oh/220vU96qEvSvBSAbM46lJHWzAnjMXyTlKrD+37qAtulXflbU
	H2WZgVr8AWGSDBDSBHndbf929QBVABq5vW9FCZp6XUqsn1Mbegjz5tg2XcPg3DfQHv7isgrFw/W
	FH/YUFpOYBlIdcE9U2pXVfvmQ4
X-Received: by 2002:a05:6122:510a:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5bc058d1631mr2808711e0c.0.1782127318515;
        Mon, 22 Jun 2026 04:21:58 -0700 (PDT)
X-Received: by 2002:a05:6122:510a:b0:5bc:58d:ce4 with SMTP id 71dfb90a1353d-5bc058d1631mr2808699e0c.0.1782127317993;
        Mon, 22 Jun 2026 04:21:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9e53esm16899491fa.6.2026.06.22.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 04:21:56 -0700 (PDT)
Date: Mon, 22 Jun 2026 14:21:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add LPAICP firmware for shikra platform
Message-ID: <si6krpjcwcs2xz7bj54g23jzj2layxbfqou74z4jri2eiz7gxx@wfgeb2liqffp>
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
 <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
 <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
 <czrjz3taxceyxohxse2dzalvgg6uubtk7l7juj3mt3cgbpqvtf@vzlgbd4pf6mc>
 <94b93be6-9281-4e6f-ac21-a32fca2110b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94b93be6-9281-4e6f-ac21-a32fca2110b0@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExMiBTYWx0ZWRfXzQ2phg63qKXv
 RjS9PYZkkoQmTyCf5nksZGIR7SSlknuqhv3IyONfp1hQMpb3PDC+y+oavXdE6C2SzkqjXdYLhDl
 vuxOhXLP90YXYFY6bdOXfiLoS5gxh3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExMiBTYWx0ZWRfX1xPZtkEBQOsI
 kzIMfSzkT6JKFAPtY0s4VMm4ktLs7XcUkWpv+3sARdkrE4Ep06HTHjiJlkNcHEHc8Fu9Qxv+dWo
 rz9NJJ7JuWx2E8V7ET3FiMRHmGHvnv5PGJyO1CRVIfV/DgbA/BRc1RuiA3uvULvw/SQrIuiw8x/
 yYEWu0C7yN1KNrZgjZhRNSMJ4qlh8lK3yr+oADl1BZQkUF3ATdGFTnkA9nXs1nBYwqAWoV1X397
 rFsOdQDN9bSwPzRb85dT/mjAH70kAjhA6rwlfAdxf1k6pBfO0095Zu1GV3GU7JW9frHvwIARNnx
 EJgHz//wXNsJH2OxqR+1e9CZmtjB44xCAA09TxenxvAF2651lmyLPPg5EXoBbJxm4yiQxMdcbDr
 KgrQXyjs2zM/E/g/wWvNorZ/fl6kHUdkqPVJ2ccH1gH2O36PWW/VtHTrmPVPmBM33fh6pRaJ9C3
 OlAXcIn6fSTcYRtPpQA==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a391ad7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=3itKJ9y1CgWNZ6cxht0A:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: VZVPLyANQC0ePsxthkkkR3acIEkNujlz
X-Proofpoint-ORIG-GUID: VZVPLyANQC0ePsxthkkkR3acIEkNujlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220112

On Mon, Jun 22, 2026 at 04:33:53PM +0530, Venkata Kota wrote:
> 
> 
> On 6/22/2026 4:26 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 22, 2026 at 03:14:19PM +0530, Venkata Kota wrote:
> > > 
> > > 
> > > On 6/22/2026 2:03 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
> > > > > The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> > > > > 
> > > > >     Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> > > > > +0000)
> > > > 
> > > > This is the same and old commit.
> > > > 
> > > > > The source branch is 36 commits behind the target branch
> > > > 
> > > > And GL refuses to rebase it because of the conflicts.
> > > > 
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > riscvfw-qli-shikra
> > > > > 
> > > > > for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
> > > > > 
> > > > >     qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)
> > > > 
> > > There is no forking done here. The process is just the same for all the
> > > other changes that we have pushed.
> > 
> > I didn't write anything about forking. I asked to _rebase_ on the repo's
> > tip.
> I understand that. Reference to forking does not make sense.
> 
> However, I was mentioning that we always run the following commands.
> 
> --git clone
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

https://gitlab.com/kernel-firmware/linux-firmware

Also you don't need to clone it each time. Just use normal git commands
as everybody else does.


> --cd linux-firmware/
> 
> --git config user.email "venkata.kota@oss.qualcomm.com"

This should have been done only once.

> 
> --git checkout -b dsp-fw-00qcs83      (Create new branch with dsp-fw-*)
> 
> --git remote add clo-fw
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git <which should
> push to the tip>

No, it doesn't push to the tip. It pushes nothing. It just adds a remote
repo.

> --git push clo-fw dsp-fw-00qcs83 (Branch)
> 
> --make changes, commit and push clo-fw

Anyway, just 'git pull https://gitlab.com/kernel-firmware/linux-firmware
--rebase', it will be sufficient for now.

> > 
> > > I attempted to push on gitlab directly where i ran into the following error:
> > > remote: GitLab: You are not allowed to push code to protected branches on
> > > this project. This is the exact message here
> > > To https://gitlab.com/vkasinat/linux-firmware.git
> > > ! [remote rejected]   main -> main (pre-receive hook declined)
> > 
> > Which basically asks you, why you are pushing to the main branch
> The idea was to try to push on the fork and raise a PR using gitlab --
> similar to the way we run on github

Yes. But why are you pushing to the 'main' branch?

> > > error: failed to push some refs to
> > > 'https://gitlab.com/vkasinat/linux-firmware.git'

-- 
With best wishes
Dmitry
