Return-Path: <SRS0=oSiP=G2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D3C61DD3
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 02:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E9681F00A3A; Wed,  2 Sep 2026 02:27:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788316029;
	b=ZUZSM5GxmidqsoAlg1BGeo18LMztsntRfHCFjmp6tMWDsiVbhw5lXBbgUhE1S/ZwJ0QI
	 CPtVo/qX9ORQkK/ugAy11P7PDW5oBcZKPJ+7N2GHGDUaYmR6wbyTY/XJkP3KV1ObZjD8L
	 7RXssHA9S38529Vd3b6Pp1c+aGBHOgzMpmUvBIHTwSgd+LYocKTjX3uP7eTWxzQhq1Jxf
	 j7+VvZs/fazAt+jqDm8Ej2s17NY1QnOBX7LefGTnRV+HVknWKyEW/TX8g5Rtp41fbPHlF
	 tqCaK+nzLkagXFeTk+7jaFlbyBw5aMj3VvHRfULw+eSxX2VWiBIwmxA0erlG/hgsd2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788316029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YZywL4obL5oN6LIiHxSA59gtlPyTmzOxS2J8b+Xatcw=;
	b=AcTiZnPgqXH3p0W7CCYRkWPAddppDj9Eh4YIfDGkuNnjOg7lCtuzk2oetRJA7sT8t6PM
	 hxEXRkj2suf84tpFjRMf/W3D+fXLKtaiy75Rr+p0klAtwaeBNVi+sF8mpYUEGqBJWL2OV
	 oXfyjTIVu3VjvSVUjgfFZE/otKDKo9U30NfBDbrxwAT22dYQ+Rtjr3Rj+EzDIVXsvMT5B
	 L5iUIhbhkQwU34qJM2CL/WmKp84ON/K4UZatya1+HznhE3AD6WK/TeTfRNAUNF5swkbeC
	 QcPALCgeua/hHwnScXNwH0liv8zsRTYqpymHMt6E8TF/D7wMeMQmzR7ZWKhpF6nhaAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jw9be2O+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiYjBqQF;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC3011F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 02:27:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jw9be2O+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiYjBqQF
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AC3011F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KT6Sf147558
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 02:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZywL4obL5oN6LIiHxSA59gtlPyTmzOxS2J8b+Xatcw=; b=jw9be2O+SoleAm3g
	OhXFc3BIy6YNiQw9XKIZMrA6miGvykAwmYczT2CyvmZwf6iRkNzTTSBZLb806nv5
	dl+UeasU9C3L0qwjgCyJdfHxJHA2kJ27uKLHV6sqrvF0FF+3c2C2cSiLMnIbNQdS
	bc2oJYyGozvhpc47AXOzANcDzHdqPV5vhweH3+ILiV5HKc9eGzzGkyYDUvepq+1k
	DQ0j3xlqsm8PpG8B/SIB4ooPrl/nkji7DPu0+pR/cAbgPORKJm152fEUl1qnHKOl
	4PhTl2H+TDfxjvEuzDZAsJ3vo6zkj+xwVgvLv5ZhKe8Q/VEm+O63Kea1E5cgPVmk
	9+yW6Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9nk7qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 02:27:01 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78830f4bebaso113305137.0
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788316021; x=1788920821; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZywL4obL5oN6LIiHxSA59gtlPyTmzOxS2J8b+Xatcw=;
        b=hiYjBqQF7BdFl8KVOoQ+YTyzWXE4rSA46vBK2dYYOf/hYhTA8knK/dbI0fJP2FqVaY
         DR786Yuu9kSJJTt5o5Pndg0g/WTQhIyREK2jfG1TMHJkA+4seOTn18vxQpF6Ry2cC03S
         xEoA3Gl57TcgVJ4pZJOaet+85hi96gDA9K6Hv54JVh3A6hc9MxHh9cKTj9NOAQff4mCr
         S/fL5qDxFoZJQRFoVaBCr0GH75LP+f15VNp0b9t5jmZVYoPt1SiIWHBRlpNApMy/WruN
         GFf1UiyUD227NUACyMIPWxSumr/RBK4i8MCGiYsTvNW9jADOVRD1jG8eiOgDEv5FWj3T
         2UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788316021; x=1788920821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZywL4obL5oN6LIiHxSA59gtlPyTmzOxS2J8b+Xatcw=;
        b=dLIEOpgzJpwYEawX21dhy+a4eLM/DQeH+c9LciC8+q0UxaKONfJK3BTEjra5Nr6f0Z
         dzeHN8gabvjqBxEdYCUbzv10LQd5BJPCp1LPNJQB7cH4AF2RZ6kWx09Oe/26Dfss6H3f
         5K99zMj4LdFCJI9DrNfMS5Zum+C/NAe9hwpAp3Hp01qjJs3fGtV4b4cE79VrrbfIu+bw
         CJsCdCblXyg79ztdFDHzYpu9V0lkIdp/AO7VuYfCZQIN61ELkqmh6quUMdFFq/QXMtLt
         yPBIELgCkgBSezxo1fjbzxxzJRAvB2oilg+AnOrpyDejrkFZnHtL1hwNKgs6y71yXkFj
         p8hA==
X-Gm-Message-State: AFuF++lCAvrYCUVWVZjps+lGA1q8gljTIbHe1jkjMYt2k87/2Ja/dVke
	AuoSFRVKtyiKzhX50zFhnREk6RXgQigQDs+ESLMaRadc1ke3iQQvLYAVTD/DGep8K25eu9oqVgv
	3w9Azx4tGmVPA8QJNC+XOtW593OCmzAaUzabgVwDIN4bHVBNtoBudGNxbRx8IPSwLPhXySvs=
X-Gm-Gg: AYBFou1Skxa6CHIkcDYIX3wYHPqqqwYJqxm78xbfwBxZyEyMp+XYjissBnsCajhfiFR
	ZbLjeWGnTeEqC8LOzALUzQKpvxzIWX6foTVh9xrTKKJMP56gZazpqxWJECJhl2JJay5byaGnyQX
	wDrNboo5NiUX4DkzRw9Y0PLl2IHRPVUxM4ZiugaKTuiEZ0qGwS8sz3rXSoZxehm1IWpGa/6aKz1
	oqIi0982s0+elv3dLKfMLKEjtIDOMHcrPrHUsbXeTf2H4FGO2t9NBSHC8YEkrTYI56Yh86OroQd
	eJ9zkvB32oDt+NXpZyrpO9MgCga0991rzdO/stkKsCStqggKO/kd/XqfgE/+4ZxAi1r5IOnJLa8
	g0mAyg4D/+C2zUQoaPchM2AdykAqI1Xn5V1KxGofQCOHOWaK7FTTlhuaAt1OnqijcbVW4XaaaPc
	E2dp3lwJhJ7rTD
X-Received: by 2002:a05:6102:3fa7:b0:778:721:53db with SMTP id ada2fe7eead31-78a1ef1b38cmr470923137.0.1788316020619;
        Tue, 01 Sep 2026 19:27:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa7:b0:778:721:53db with SMTP id ada2fe7eead31-78a1ef1b38cmr470912137.0.1788316020097;
        Tue, 01 Sep 2026 19:27:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b94fccsm242165e87.40.2026.09.01.19.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 19:26:57 -0700 (PDT)
Date: Wed, 2 Sep 2026 05:26:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Message-ID: <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
 <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxOCBTYWx0ZWRfX5ZURWgJTFiM4
 s1XWBYHicdZo/USWpYI08pfTkpG7/LMnWZIgyeJOcSLDbIJii4wPTvuXGz6gYimy0PeZ6GbpgrS
 Pjc4p8UWQO6Y2JB9Z65lTJs4Xl6kO3w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxOCBTYWx0ZWRfX9clxwi5276rd
 M9VNOGU41CkWUvjbVxcRMg3z8rkjKC8UXWGWZduWBVANxVBYdjY8wuxe8lAYbGIKDMmV7S5ON4T
 hJ+mEQ2kzJ9ysZcAk0IWyUBBVhcqqCsIp9mGTcyb0Q86WpK+4dMA2JyxhReuxIjZCXwQOz/vIE2
 puk+UArwAFjGNPQP5yLUpjqrcAEFt8krNWqzgixK2UNef2rsjSb/XYwDKkLR0be3doCPi/H0m/X
 gUN6ByUq0L0n7J4zZjU2nkkS1/RiJqgoIY+UkVQ+RPJTUpAlKzT11+VZ/MaaVlMHg7SPt1/SW6L
 8dxC3wVJOBG/Uksub+CTZnbCzUcAIkNY0WBoanjGK4AzR2nkMLjp0MGyRh/ad3rQhUG8Sg5WQoS
 JuRVeJ31r8fqySJymJJr+lqvMuW/DKnXOIJusSIfMZXF7zg6M3H7EP4fj1vdnENlQ1EL5DWMF+X
 ix9uYsrCbQIbKz+tqAw==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a978975 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=3z65ZAVoKZU4c1mvedQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: pSsw02Bh1VlXW-ftSrJllAalNQQMTsBx
X-Proofpoint-GUID: pSsw02Bh1VlXW-ftSrJllAalNQQMTsBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020018

On Wed, Sep 02, 2026 at 10:04:09AM +0800, Shuai Zhang wrote:
> Hi Dmitry
> 
> On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
> > > Hi Dmitry
> > > 
> > > On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
> > > > Please test your PRs before submitting:
> > > > 
> > > > E: qca/hpnv21g.30c not listed in WHENCE
> > > Thanks for the reminder. I'veupdatedthePRaccordingly.
> > > 
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
> > > 
> > > for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
> > > 
> > >    QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
> > > +0800)
> > So, previously it was a link, you are replacing it with the file. Why?
> 
> I checked the WHENCE entry and thought the symlink was incorrect, so I
> replaced the Link entry with a File entry.
> 
> hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I
> originally submitted.
> 
> Please let me know if the preferred approach is to keep the symlink and only
> add the hpnv21g.30c file.

If the file is already present, why are you submitting a new copy of it?

> 
> > 

-- 
With best wishes
Dmitry
