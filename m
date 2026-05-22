Return-Path: <SRS0=1L2m=DT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F0ACD5BB1
	for <linux-firmware@archiver.kernel.org>; Fri, 22 May 2026 12:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E30DF1F00A3E; Fri, 22 May 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779451482;
	b=iu7NkBwNifztsIpFeNjU09IcQ5l3NyGgpm4eDIIB2sAS27FZMpvt5timmGQWzZ+x0isv
	 9T2rM7f9ontotKe31LnEFPIwfIYwKH4zXjq9m2aJ6lvKcaQMFwagdQingDq2QNCOqcI3t
	 xRRV6ih0Tr8WQRSuTqL75N2xlrAGqrLEggvTXyVCIMIbicpjIyjOB0AQ4UqPiZ3y/Fyz4
	 AYOt4JR0/EHsiflA1UIHINEB0x491pITAPT3Gf4AwjeXDoEs95o9byDy2q3bKRAmniKWq
	 RVy9TUy//Jpw9LicoiakL1xY5BfZOtKZrFw464apUvDonycWaY+O+idRaXq8Ap0Kaeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779451482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EFnE1x6Jz05qDsBJUzRRoBVuyaIpIlGetEPviT4dLSs=;
	b=oX5hnEzIkvUtSIVhtMBgMdDz2+bHNccQP1JH8LCM7bgisWBN4fW4zWjPhCIl2qDHY8Vg
	 S/cNQXMjJn0BniEiaRqicCjHA5mvDDOEG9PCVR1rnb/HH6iyZ0fFpqEL0Mn10A+AAl+Eh
	 4kybTEdrUxZSRTVnF0iiIZGExY0XcpVTn4V9BUjV+ZdHUnl8l1OHy+cjnmZcxa0pftajV
	 85Kgn6kvZj08fLcT/SuHYkyQ5ANpSrmL1Wrmmk2nDJsqZxgTqeui0IvRhr+DDmsaNwiNY
	 2qcnjFe/HRH6T72gwCjU3U6xgTTPwM897WwGrHa+UK5Qs1VbanIpR/G8dp/Dh/kW8gA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtL/Feyj";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uw+aOslL;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ECD01F000E9
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtL/Feyj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uw+aOslL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3ECD01F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA5WQf312913
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 12:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EFnE1x6Jz05qDsBJUzRRoBVu
	yaIpIlGetEPviT4dLSs=; b=LtL/FeyjxsLeM1jgVuJJ+JV5mVqxrNOtimiUMH10
	vCwfW0TbTZMCjiVsdsNQNaHR38rmzVPwlz+UTruse6Mj3buV0mI90jMCYoJp+9Jn
	tJ4A/hL486oAmqAx0zuYcISpkt9/OFZHSlmC4UFLgbx0+ijSIXoKzA4CDUnbucTK
	WIfJXNPuOCae+lEPgqPCTLYsejLaHaUs3Ao1IiI6vHdoZCFkZ1ajdJmelZTeD7TB
	shJcyVH8ngJskvMCBWx2V8u/Do4PxwNWU4GwwZWzcfBhJAPzfQv2PC9RP91pwxWO
	QxcUlmsbNAQEOblKMpSU+zfWcAKE+j/Qqb6YEUiuD7Zvqg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833phu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 12:04:41 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57539ff73cbso15786012e0c.0
        for <linux-firmware@kernel.org>; Fri, 22 May 2026 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451480; x=1780056280; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EFnE1x6Jz05qDsBJUzRRoBVuyaIpIlGetEPviT4dLSs=;
        b=Uw+aOslL3MwrRWAXyeC3fF0cOs4I1SYV36f87fY+BRMCONfArrdlu4EGH2vThvsHaZ
         4fI+FE/+ARpanZKqxBUxxjn8NHrPbqxatXOO4X2tBwgJ2hDHvxo+riSQLW6FACvlCp65
         PRRiOXq+lsdZ2geNr0EsOxLsrlpYUP9htyY+IewsnGgRvkuaV9S5Q1rF4RGAME+mqU++
         Jxus5N7YiTjRClUWzer3urg2TcW/1u5xC4NO9kHTwCcjcr7xSO0augso33LL6hMai0aI
         4Sqdqxo0aLpNEsgW0V/Y6OmDLNRLJ4hT5rZgc62oI/RlhlMGlhZ1E+1hyu/MBy1kW26p
         9Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451480; x=1780056280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFnE1x6Jz05qDsBJUzRRoBVuyaIpIlGetEPviT4dLSs=;
        b=I1hDmCClAXoPzSQZLFI4noeAISfSHLmlmaqk3ftNpLSGJXhsim5butIS8V4wGpWpPz
         xBzkrTHNigvBXtqrab08IJYJyZSxZhOAFJmaqbAsdGedbYjHiLbAU1JrKz7JP3yhD0Is
         //hi3TbeLarSz8/TaqVOsybzf2a6RJ5DhZ5Z16XVt1Xd/QTM2VYdg10k0WQd/yehUkZR
         dVCXrobKQ1m6E+U1BfpnMCDbCqV8hyQIrc6dTidK3NtKMMymJmE821S8IiWSp6XgR7SQ
         iCoj1lanHzxbdDBxXslRJ0qBehUCG7LA3a3mjpyPlAm1zbpNsCgeBy+0M5vTk4H38vFa
         MwjQ==
X-Gm-Message-State: AOJu0YwfTcaMdYj45r1OVWaz3i9S/LfbwovHgQ3khk2qMkdYCYLm3goh
	/HfdpkMepiw8clbxetKzEQpx3n6ArjzTfUjMq7lTZMi1S6bNlQGDRagqsZYW6uETBxO3BMHpIfX
	3ZbAMgnAxZNVMUrTQQ40gR4W2fTdf6BoPD8hMxSJ+iuxOmXvL/GdGyhJrzIT/UFO3/4nEGIs=
X-Gm-Gg: Acq92OEjb3+b8zKp/HUYZM6+gES65X7m/5fi1CrjDFdlzQzapTHLRF3fxTXFA3rzKIH
	sdWutiU25LRoWEFk4Mctn5X3UFv5mvd8vaswm8oH/8To7TYRDq3HpDeYZC9Grj8o4vYpRtd0rPg
	tsYmSUzZKok8DYYPUz+Vs+agrMeeYHun3Pmly7hPOjL5d26yaStVdneuH+7mdAgODWmhONw7Om+
	IyP3SBe2RvdBwe1cHpaqQJKkTshskyufHia4WoChHJn00NeBy86qVoFn/F3XTst/nFu+4+krO8O
	/Z4jZzski8urb3BVwJ0MPtEHVGTbBTRCOnmlpz8+dZ0x8kV3j8sj7jeI1Kqj0NzEaByU4n33UXg
	/AAEAU+j0Q+DxHL0uxy++HEq4RNQAoyP99KIAhsAg8wh08KZWxIOICUTtBNoVs9qgZ/UoVJtwCC
	qW0YAKNaGB3/WJC2FTltwau+LWNqCyDNmcFCTaynusLfTSwg==
X-Received: by 2002:a05:6122:2a1:b0:56b:9534:c06f with SMTP id 71dfb90a1353d-5840e635876mr2497152e0c.3.1779451480299;
        Fri, 22 May 2026 05:04:40 -0700 (PDT)
X-Received: by 2002:a05:6122:2a1:b0:56b:9534:c06f with SMTP id 71dfb90a1353d-5840e635876mr2497124e0c.3.1779451479805;
        Fri, 22 May 2026 05:04:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf93c2sm380981e87.79.2026.05.22.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:04:38 -0700 (PDT)
Date: Fri, 22 May 2026 15:04:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Add and update
 firmware for Cirrus Codecs and Amps for some Lenovo laptops (20260522)
Message-ID: <xotk54bxwl6ib4hkvs7hotuev43uw42lskx4ocjdqpg7re3pk7@iua6jotk76xp>
References: <001601dce9d4$fd62c740$f82855c0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001601dce9d4$fd62c740$f82855c0$@opensource.cirrus.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMCBTYWx0ZWRfX/NtVC1/uwLOD
 oD84rGh7oYWEKI1TJPheZqh4tXuQSUnKhm2LgUvGlXOeJdJa7NcWpLjTHPDkuah3MHUzmQlNI7e
 klxblTLa+6Z9yRJ1hKTxsmEH/Ovn3Tp+siSECu9IbMrAgbxkotUYUPfoSG0RDeFN3iZK7yMX6Mq
 JB4tT0a+SWIiXAKgX0mmNjkXhwEypc6tLrIZc5k+s5gEjeqMaOG9D61x5QQ9Gjzi7mGG6JIH7lS
 h5sFppXNnNBJlpX0odikpaoP2rjbsNxc1zKRMruB10w6BxhsTIwOGj/7wqjUJ3Ne6sIqrzN7CT+
 E4j0aBVXedyv2p49tI5umlAwSwaYq1ZEbfPDZS6pD28+yJzpHR0cK1g/hwTflo4hSwTLyNWoX3E
 jHPRh8dEPBQvxmdHTBnqteRxnuvR57+r/bHvzYiz5QnFzg9yvvf4fsWfV9XcPM9MTpVWvmFUtG8
 UBJ1DhrDoQ9NDJRhrLQ==
X-Proofpoint-GUID: N-Y2js0mm4bEftNbcPXLgiMUVlTolWz1
X-Proofpoint-ORIG-GUID: N-Y2js0mm4bEftNbcPXLgiMUVlTolWz1
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a104659 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=ua1MgcoedE9oHeqaDdoA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220120

On Fri, May 22, 2026 at 11:23:10AM +0100, Simon Trimmer wrote:
> Hi,
> 
> We'd like to add and update firmware for the Cirrus smart codec and
> amplifiers for some Lenovo laptops.

Merged and pushed out, thanks!
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1062

One note:

> Update FW for 0x2352/0x2353/0x5158/0x5159 to version 1.3.9.


In future please consider specifying the version in WHENCE file rather
than writing it in the commit messages,


-- 
With best wishes
Dmitry
