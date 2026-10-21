Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CAE606A330
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Oct 2026 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yui/9WGB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRVP1aI1
Received: by smtp.kernel.org (Postfix)
	id 5BC191F000C5; Wed, 21 Oct 2026 21:37:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792618624;
	b=11PlU5WMWyqprI94zax3uOQ2jgUOYWRtunOzvFJQ0EmVN44Lade+ETYlJdDshHHTQSGt
	 NSd13YzmjDLd7db9C7TTcnbEYuOWjweZZWxwDDp0b9g12u9E4Z2ejO20rtukes476J4vn
	 i29MFVrILHb1cluUv0sOYsqLYBAF7HJ8JiODN8yWCmxMvrO4gE95JVdWndYUcPOIxfQsk
	 JPQTeywvYLLAaGR4gR3x050Au8ZmHZsxsTkIYhXHiuVhHm5lPeR5yXDTB8vGwv39+P1bh
	 KwuiQawNeQ2Lne1MRe/x4B26qZ3o/FVf5RSFDRh9sGhvB5MlN+rYC2lTYPJTf063k5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792618624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BMLt2QnmuL2KEHsqA/e3vY69eqC1MRZYuQmNnPKmjPY=;
	b=aYoS9hvopHxW2kgWAxbIzMIjSAMdQ9eQguhyHLg0MI5j9O6I55bvN4LSdBP+qh3ZwGTL
	 gACkajriVTHP7HUsqsQ5kPpeIev2OsJazttMaZL5Vr9l3hbXZBEEL78X6HqQgumSeD+tJ
	 x3AEKkvUszSs+84P4NLEW5rz42X637IRUCcyIzHjSTtuPaZZiJeNKj12EiUcHZXlzKBNM
	 rKyfw6Qqv3Jmy+3A0VxLnnNMOZ5yOKiLvM4QqXsY5sct8CQh8DnwIGYPoXKxM5elnt3kR
	 YxA78TrztyppigQMzJ8X/d/yuC70XdD7/OgerGYpCimyDpr2rKV4MCjaD00s3HGWM/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yui/9WGB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRVP1aI1;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B51491F000C6
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 21:37:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yui/9WGB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRVP1aI1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B51491F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKePfu1154682
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 21:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BMLt2QnmuL2KEHsqA/e3vY69
	eqC1MRZYuQmNnPKmjPY=; b=Yui/9WGBJxXj7+KYmNNkXAIUTz8P2wL22VJV5lEL
	+6nOw/ORSUn1GA1cBA0V1tm9n4xk7kcbyNwf5E18YZ+Jsne7VTGvvRwp59GvdNBs
	exnBIpa3tWNCK19yVys9K1KeefimRmje83xLkSfH0AKkA1l7C7VN9OgnuUiMJdsS
	Ye07OE+ivihxafYJj+Vk/GLo2DVDbonhgxi2csiaTtFsDr8koZB8doGKw7UDZK4q
	HYjQ4TUjTURkVL7KOKHyVYlfpc16d4G3j5s8JFfyXgQiZ8n2Q35xSx8ierHj580Q
	OAVZ3SGW/3Y+wuZLhNQTQLmczSRYcGTo4MUUHuToZUthvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0cv1acm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 21:37:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so276764585a.0
        for <linux-firmware@kernel.org>; Wed, 21 Oct 2026 14:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792618622; x=1793223422; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMLt2QnmuL2KEHsqA/e3vY69eqC1MRZYuQmNnPKmjPY=;
        b=ZRVP1aI1m6fmCBRVgRNVxVicOGjW9RuiAtNvsn8FFP9CcyWSzvQRl2iC/YAo5sAFE9
         SLlaYMpxm262aEjViPNg6xUEZUZCw+sW7ec9moPavWn+Q9m2iUfF03gPTJz+rlbn5AyV
         Buri7NQQWqz70V25OrRgW8LzcltmJVnIfhzv5QvyfNFHCGlKhtkBerzfq5Nw/sdxYLLS
         W28R9B+TuFzWNcTTGh9Ds9WEoUSyRER/Dn5td8t0FELv8lL35P7HFwFyOn/pFW35LPzz
         2Y53tb9ZG0UvK5l0kOR0mh4addgAxXTl5XiJCj4hLdDAtlIxxjBP5zIKg2fGSiez1jVE
         p3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618622; x=1793223422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMLt2QnmuL2KEHsqA/e3vY69eqC1MRZYuQmNnPKmjPY=;
        b=hoWASjA0qC/7kt6+H7fhkJo/BlCn/eMWkXqPXnhVRFFiX5TUQ1A+91XBa0Q04mM20O
         1ThINmDrbrdrJIyLeFihCPkprtD1x7pp4LS/hL5+2T7g2//mgzjUBf17kyzFUkbOPv6w
         ijwAJUeRakCqK5cZwMo1jDeicPBhrike3dYaQrHlyilKyNFa3VjbXYL5Z4XtxFVaFcLs
         WOcrB+gnfBeXqXyITK42JY8aRV0LTeS1MyzfMGVSvvSirN6MearFBQmFU0l9RiL/y9lj
         MEzVo5RBKDJk8oUoQJXhUxUb8TnAWhs0+IrPBzYdA/fEbJnjFhjM5SuOyD9sny0Y4jgS
         mxYg==
X-Gm-Message-State: AFq9FYIkvMS09gjOCUYxu3oWD0dbjDVCE0AfKdAaRq2KfQxwM8c7j0SE
	hPY/Lppr+k62OGsN3xSNRLzj+lrw9Q2fYfpKDDIXEQYPyc8B5sgtezk/q99EJBXEGw0gtEdlgDQ
	Nc76MZETGCRPMzSoitVN60FzHuezDCDLPxNlHmyiQsS8NS6T6BbUjnPf2KRVkCg0=
X-Gm-Gg: AYBFou1C4UhOdkOfgIT7I7uZ28MqYK9MlDGkW7AIchOnRWCssG706E89kE6cibI+Brc
	UmNWru5U3sUha1cUFwnbQqlunWYakK6ULXtgAqT6nXsNYprQWaSVK01KpYr30TDhcnBqiKLXszI
	1npbGYLEzjbn6hr4ynoOVYepfrtMSNBsVdNHTqBRUQLWx8D3Fk5bXCoNHRz8lEsuw8bcCMcHKIS
	6UKmR+aflmuM6MouxlG1ynhhxRVtw8kBrzNr/uY/WID2xY2dvsH1GHgr+buxQqD6hYLYSx6o3ai
	mDo6yVOXhxPDPBdrwirUBwDCo1bmpUhHHiVW7QdVYMiZ0UcTNuQ0/y7T016KIUe+Krko+ugo7LC
	MXSQ9bHRoo8H3AMVNdg9kkXlI9tLii8/TfkVN9ms7lIe+rsIVqr2uRXtsYhsxSqwDwTKe0lG7O5
	FLe90tJBnB4QW4
X-Received: by 2002:a05:620a:1990:b0:93f:34c9:925e with SMTP id af79cd13be357-93f57f20944mr646907485a.19.1792618621770;
        Wed, 21 Oct 2026 14:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93f:34c9:925e with SMTP id af79cd13be357-93f57f20944mr646904185a.19.1792618621330;
        Wed, 21 Oct 2026 14:37:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa318497asm531633e87.62.2026.10.21.14.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:36:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 00:36:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Puranam Tejaswi <puranam.tejaswi@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Nord chipset
Message-ID: <52jssumpzvfn6736rfy7o2aqu3ptatiwgtnevvtdcxsoo27nbp@b4tiom6yysjo>
References: <aacbb97f-53e1-496e-81fc-2b5674c00373@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aacbb97f-53e1-496e-81fc-2b5674c00373@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NrRE4MdJ c=1 sm=1 tr=0 ts=6ad9307e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=M0ria7zStHFblSWqNYYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iIVvRXiNoTZ0Wzkqj_CQyMxBTPEfHXza
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4NiBTYWx0ZWRfX574vTKXEBZ7C
 mK1Au+Fimax3ZlRwAnPRFiseDihbHYUxxhtRoXK/mgLslFh+CbZRVUd3CEwOhbDL/UOXw5kYY3Y
 4w2/AcDrQSBRLewZeY+DZ9ydJGKro4Q=
X-Proofpoint-GUID: iIVvRXiNoTZ0Wzkqj_CQyMxBTPEfHXza
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4NiBTYWx0ZWRfX/ddN8taZ/aYl
 rsfQR9byxPFZxO/J64PHRxE3QZ5NEGP7tFmy2+9KnsOeqxVWF+pnWM6q+1UdTYxEBvG2h3LxSwk
 VKR0ET+og8Xj7DMWtPN3X+nQdrxezs4SkgWx6caHcKOx3IMMNsFxGBliEJE5XnwgVCOur7t+wGm
 IVKwG5obae66KeHDMaqWEQZKA21xyHwH7K6Y2YpUajeSD2ZVthgMxx5FFtXnBO/AUpopD6meISi
 14E83NzhQo0Fp3YVpiUAj7+cFB8dY7AQOge8LHsS+VXLx/tQMm4m4iH2wtSpfinKaacFFNW2s0H
 u2ZqF0osxiysBixnr4vIvzYJ169Jw6+EiWgL/1ApvNCa0fI7mxG5SXWp2lTv6d6DB2Oed1b5wQt
 YYsqoLVlKjzOkk1tAQZPTgdx8eE8jV3YX29vodmfzAal0ZDS5lbhb6AYFPBoeoI9euP3ZiroOjs
 JSHrmV2wUo1BrmgSEyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210086
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 12:52:28AM +0530, Puranam Tejaswi wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's Nord chipset.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1318


-- 
With best wishes
Dmitry
