Return-Path: <SRS0=oSiP=G2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA735C61DFD
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 08:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8602F1F00A3A; Wed,  2 Sep 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788338173;
	b=t1kYfKWreA/Q2wYI+Ly7Vit6YtszJj5p0v/OCBozgC6Styfj7mie3AjvbTRcSkUtgLv4
	 WcN9WxSqbBT8AmPARkqB9Fcn+d42xoOhRHf/e2uRa9kRb1SUUCsupYDk86AITrOGrcpwt
	 LYLfvzBRpDJFnSJrtmme8GPk/acGl+dv0/7L6mJjXPHfIjwPngHApy65x4f2VvTNklgox
	 +VmoACH/xMM6SV5qfvLg+7ZqvhbaYs+BjHaA6LNRyR9LYMYYDKznWg9AeLO0gn2+Qbe1B
	 KX2gbZRknUICMdNEjIVVSEf5IEjqYgcfC7wz5Qg5AKpnabe9TOdkaHB7c0siqFzC+Bg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788338173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uBcO4ezW+HDWIcS3aS2UPR1XQQQUH01HpCyCPrqQqMQ=;
	b=fYrdjcRVftiPtUw5MfAyF1Q5Qos58LCl9PRUsoWvJJVXyAI8yVfz2uBf8cX68OwsTuw/
	 gHJZn9P62QVDAgPRx0g9cBo4wmAB5hfm66pXxPoZcTsoeGUquqz8k0A4ibIyoYB3ylM98
	 hRgWzbeozi4i/XgXYL884E/psMaQI9YVXqvRGjsVT/i39N+XErkeHSGsAhXnd5dnNjo07
	 7kq8hZap1COKWX3RKKrGzCW4jEtMNuzo3tVwbJXOM0ZzJ8bwLn8r3gAQuuyjwnyNHVSmj
	 1kG8CfHQTmyUTZuxTTCMlBvcbZBbHu/k+hRKbGFfRegqQFRRK81znDftpHsgG9zQWzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFZRwPjC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="f1W3X/ko";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E85F41F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFZRwPjC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1W3X/ko
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E85F41F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VipA205010
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 08:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBcO4ezW+HDWIcS3aS2UPR1XQQQUH01HpCyCPrqQqMQ=; b=gFZRwPjCMAqg4pIR
	55dySr3gfKeRewnkA7WAuFl6FbL42XleTUAFTaqYV1cxUsBQXl6byxXadetQZ9Mj
	YUbqDO73P/2DK/SYxhWCCQqJD9eDGh4dOt/kbk3z2m/vlZuJ69nCPwK0fXL/UoK3
	Q+llAJUpf2WtqH22i4AoJVfkdWoKeiYQoVpt07HlWRlqo1H8PbKwjB3uMNfv5a82
	LveVMXLcmnNZiVMn6WzwgD+y7GbfREoUQfWiGS3zdnKUy5oGObw/s73Sg5SfxZJI
	nGyFYy7EDzUYtFZ1ogKsjAxfoebfP5CM4dlh9NWCbtBEefTWQiol8hkNKbzxGLco
	WnT2BA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbfyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 08:36:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c65cf2e430so231309e0c.3
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788338171; x=1788942971; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBcO4ezW+HDWIcS3aS2UPR1XQQQUH01HpCyCPrqQqMQ=;
        b=f1W3X/koeQv4otleRm+5xbnkcGQqVFOJclrROCr5UO/9O/QXHX+cB7o7KT+680wD6M
         jnTseb80h/5rmc/IMy6wHAQRO8ictgiHhNnvTQ7c3EbFT2kvt2Kas4Js2dhW/LMNTQC/
         Wnwp3ZHYeWbjtE0yj19YiKKMlaJ5IcoF6YNoBSM2BT9lbmJdKDKQf194Y+WXmUzpW6sg
         4aALtiDvjl/k2SUm3bkcCOYOtUkaQrpljpByEZ+D2InVGgwGwYUe533a7d9wB3M47Qg0
         uBzQA/lPE0MotkaDdri0xhpM17icUQ5VFiySzWrt3ApUD2RiLGCYCyZROeztyLckfFl6
         0htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338171; x=1788942971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBcO4ezW+HDWIcS3aS2UPR1XQQQUH01HpCyCPrqQqMQ=;
        b=sDfWSiY7evJcm+D2Igk3lyMPWnNJmEuRht2TEaJzwdLTo3fEmkL+bn+rq2VU5of5jg
         oK9e31KVC1Qc87lMFyfxZtDogR375QbPFycCSK+pj+n2fc8K4hqQAPZ3QsyyPf8RTrpa
         3uyPozAtgygl68osHnQx18b9DtJO/CUnvfvUm7kJyJ6mnTtlVf4WCiQNgZz4qv/vY3WV
         T60HBRBAuhfHGINEDAJiqhrl93OC0Mxf/XlQpa/By85AZ/yhi3bnIkkgAFwBMc0SRRVC
         GMZU9S+dXNpmUlbk3RHkJdywFWrIJdZUDscdpIu0nmOicMuh8EJ5hw2jUNsuVR3qUeMf
         OHRQ==
X-Gm-Message-State: AFuF++n4WEeLxTrcoINrolv98G0UM1Lk28RlmnuoO4KU75V5zx0V9tRP
	pTs3vdzQIFj0F0YEiBDmglUzj3dkAb52nnrWxvb/ucFWhJoeFvRnjfCUk9szpWHQs04t844BMqF
	WoCxxeAuNGa015FdZHZL1mFnADS1AvRFeIPo+7VOs9sSkV8yK4186Q2ETWNluYTE=
X-Gm-Gg: AYBFou2PWiAxxKkOgMOclRyWwaKAltLs8R5dbi+UEJzKzXV4l+g5jojUFlWv0Lr2xOt
	5lHSAh4qq5skBgV4ppuvSNz7H9BW0nwMpX81HwU1i1TevnvzIGQUfczNskbStoLNF5RaZyUb/pa
	5mD1i9P1t1YbJKMS6DaPZY/w/C+5qsgx7vxy78r5mBfpUAC8Hy7zUVUDaxOwIUNcBifL22e2sLu
	1+phDRfNntFz8mE8lk7rj13Dn6OEuliWd2ZS0W60+x9Myo8rY5rEAHlaVL626UFfmLJgifem0Gi
	4fAJZlMzIXMt0/KkATOH6lCpv5XqdVuB0hyI4IissvwoPZXNk7H/OqBGK/mhA6FWv395cOnOZ5S
	66Mk1OH78pt9LAe2jYBx+TB9YFFlsw64BfimW2o0ruqW2FtqN71v0WoWgz1U1nUXzxwmTqwcaZD
	PWk341svgX9pg6
X-Received: by 2002:a05:6102:948:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-78a1f34b329mr825736137.9.1788338166198;
        Wed, 02 Sep 2026 01:36:06 -0700 (PDT)
X-Received: by 2002:a05:6102:948:b0:778:71e5:45d3 with SMTP id ada2fe7eead31-78a1f34b329mr825718137.9.1788338165580;
        Wed, 02 Sep 2026 01:36:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606d9f9c2sm411469e87.76.2026.09.02.01.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:36:04 -0700 (PDT)
Date: Wed, 2 Sep 2026 11:36:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Message-ID: <3lo6dh6q726emqikhm4ynikwnrefva3ucsrhrmuyjcn4wnhlhn@7cdvnwbuyvji>
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
 <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
 <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
 <819b432c-6f63-4ce4-9c80-61453fa8456d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819b432c-6f63-4ce4-9c80-61453fa8456d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97dffc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=_tl0rc8JnEgcB8x0DZAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 7AqWWXhgnI7CoJU-TrGqrldwwCIy2zdL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfX0DCst4zvDRyf
 5/eF/fg1grtDfpDbnr7mZXkTboPtgbbSBXeJ6KT2ftIKqteSh9idMisCKgV4yAd81QqE871JO23
 gt74fUld/yLCXtht7cjxhwB3j+GcQbk=
X-Proofpoint-ORIG-GUID: 7AqWWXhgnI7CoJU-TrGqrldwwCIy2zdL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NSBTYWx0ZWRfX/4RL/1ibVUFD
 SdRvZvN0uu1oHa/BlBleMe0CyFC9BBMl1eZa3A9UheFRjFagTIzd4dd8t81+86DfA9cP1z/DAtA
 +8/4va6nV0dFz68jC6Dz7H0gcxq2IM+GfxpcjiijKBsWNacm8FPi8ifK0w0zK2rWk7AtkxzQt/N
 yJii6aIKyqDnXpf91qUFO+b6sSGe7o8VwA6WRTmC6SvXVObDA5R8LOGLcP3SVNoaD8wLdGK4FiA
 H/OLDqafLH67aWu4wGk5gZWfR451BwQyjjy6DiSCo5WNLzjafvK9hQZFz0UuZBMhp6QPHD4xRFg
 DiTHyOWxt6kezpmH5SJzt/4SSk+g+8Uc+G9KjcaKlL0sLi7i5GoDOSLX6Ng5aHudhncsGZWzq6T
 31PQtPmpeG9ra2freJdrSySpv0vaeg0+P/QxSXi6qYxi6V6fW0T0R3Wa6DVGUx0IZ94zTvV+rah
 8vdeEgsxjBdW20t+jSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020075

On Wed, Sep 02, 2026 at 10:40:54AM +0800, Shuai Zhang wrote:
> 
> On 9/2/2026 10:26 AM, Dmitry Baryshkov wrote:
> > On Wed, Sep 02, 2026 at 10:04:09AM +0800, Shuai Zhang wrote:
> > > Hi Dmitry
> > > 
> > > On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
> > > > > Hi Dmitry
> > > > > 
> > > > > On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
> > > > > > Please test your PRs before submitting:
> > > > > > 
> > > > > > E: qca/hpnv21g.30c not listed in WHENCE
> > > > > Thanks for the reminder. I'veupdatedthePRaccordingly.
> > > > > 
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
> > > > > 
> > > > > for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
> > > > > 
> > > > >     QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
> > > > > +0800)
> > > > So, previously it was a link, you are replacing it with the file. Why?
> > > I checked the WHENCE entry and thought the symlink was incorrect, so I
> > > replaced the Link entry with a File entry.
> > > 
> > > hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I
> > > originally submitted.
> > > 
> > > Please let me know if the preferred approach is to keep the symlink and only
> > > add the hpnv21g.30c file.
> > If the file is already present, why are you submitting a new copy of it?
> 
> 
> This file does not actually exist. It is only referenced in WHENCE. The
> relevant commit is shown below:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3dcf6778d29c72f91aa0ac0ef8843a4aa6e11c1b

And this commit means that during firmware installation the script will
create a symbolic link pointing from one file to another. This is a
proper way to handle duplicate files instead of creating a complete
duplicate:

$ md5sum qca/hpnv21g.b111 qca/hpnv21g.30c
3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.b111
3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.30c

-- 
With best wishes
Dmitry
