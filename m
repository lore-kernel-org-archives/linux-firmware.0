Return-Path: <SRS0=3+jE=GG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4500C5B572
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Aug 2026 10:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DC461F000E9; Thu, 13 Aug 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786616508;
	b=S317aPit7HjvfNGFqys2JxecgG7YkHEfS+yn+PnUJryjO8KsdduwYdkP2vBVGKEoD0Yn
	 lfR6W++O4BaBGWpzT6uOUSupklvYKRm5/PVrhXQHh6u4qWf2HF1sAOLtNm7c70oBgBvkn
	 GRjRbqTWmQ5ulNYBHzsvyekdYxGllQ7uazrDnLWZoZbcfPPJ1rDPr4ciAtjC/AUIMjEDm
	 7vGGoGmA1AyJdYBxldqYT//TfI6kxlQ9sOo+YDYVfyyVVFwoZmm9ZZLiL0qz7A+4j1HxV
	 HGX3KykbyT1prVQS23eJ4HSIz9HjadVYZ8wPyuPlxtPGMdED/lDjJq0c+G83CqM0n+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786616508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MGAusILvSh+/CwJbGFlM7QJ4+2cfv+fTRIzjPw64Uy0=;
	b=yV2rRYrdbYBjB9TafiOuN2msq2Vq6HINQUzVNKuO+3z4WkwquLrrrhc1c4uExIr7tfQJ
	 CgShkUe4hLb05CJ7v0vAyXdbovIr/w8JID3bts+psZmBvGm4YTYcne1u8abYVk/gsS3cS
	 VmFyvzBiYpwqnqsZu5pxDV32DusSNAorCByjbRm8FOI2JKSRf+HY4AVNYKs0qnfIEMiu3
	 regmoTQm+usq+0sFyTh/Wa2IQjvMEGhc5RsJUFCzMquIzcbuljeCa+vLS8XXRg/rV0Bek
	 id3LUT24PYzgQlpVCQNmJYbzUkMYrDLQ8IjwUwmEz/igQpu9/LSZXafaj24ecXQsAww==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOgJlSGe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GcK/j/jN";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C562E1F00A3A
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fOgJlSGe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcK/j/jN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C562E1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D92BE01975638
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MGAusILvSh+/CwJbGFlM7QJ4
	+2cfv+fTRIzjPw64Uy0=; b=fOgJlSGep2KN0xKMX/2b3aJSSDQjCgYfe0xKRPkl
	g7etr566+R0CrBTx2P7Szf0Wgl0G/rny/YycT3KpBzR/Yppr7DwrC8oG6bggN2pt
	VHCXE9kYfmfXv7LHshyt5hECb0esI13CrnOTk/OFdF3mWn53uRV+rp3RwuN+lm8/
	0nc0lSM4j5yXAd2clt/isRnkHscqlnZItch6NXKWNa0SWs20S2JVdxtuuWRWrtWS
	XjrfpnJUfpd+8p2xehLDCMqrZQZhGJtZbCIlGGQecIb/71iXPAh6e0bItJXaZOlm
	0P0lRb2oXrRn9F0dyqJs/NZ0mKlC8is/Ddanu+ilsx1Qng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g158g9qdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 10:21:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce64c41efso9092591cf.3
        for <linux-firmware@kernel.org>; Thu, 13 Aug 2026 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786616505; x=1787221305; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MGAusILvSh+/CwJbGFlM7QJ4+2cfv+fTRIzjPw64Uy0=;
        b=GcK/j/jNJRmZdbXdgzqNTGr5t5oNMxpzZZM5N9opTrMxubpWurObhxyjCDxjvsm9z5
         5vKH6g8EcL+rUrpWy0pgELQhlMClgKGWACJj4wNroSXUVOjo8THpB7ob76E0tEnmdzYa
         HCnDxH+rnBvsLOLonmh+GuKP+InOWIefG1tyGsDK6m3TDyxx80f/IeHMsyIMfZkXEWSY
         SFmOX40CBV3ShET4BX0rArQCI/y7PrcYSAQZ0sdFnjbgl3azCL7WezAeMYXiwdJHN5sJ
         Mn/60eu5IDJB04dcNe+OdDd2FUSemKeq97xvK4Ela0oY9j66k1ulRx6QS+Zv1i/UdGID
         tuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616505; x=1787221305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGAusILvSh+/CwJbGFlM7QJ4+2cfv+fTRIzjPw64Uy0=;
        b=Q4jEOSfQMPyrOu7tcAdFHVDt1q1MVR6d0DJ3q5i9jom7TVHTADSgDM6JDevIcgeZ8x
         2PDn2xZDXQgbnVYxGpzZQu0sAYUsHtMJXYkIcupqstPNAA+byGoDzklOnoN7p9vSJG/Q
         SValV/Lk5fufJO6N5MyzRwB07U/27RWJAng3ODTEtv7J5wlu9hs18Sukr2q5rxteGtqL
         iKPxmgLC61EyACg4Iulvk6ka7AmcUxoCB6iNbNT7yGajsF7bAO9kBxqBPLyifV27hdq6
         Y9NySnWHQx4nVkYKFFiAstkr9hHjH5HiTfavGK53cH+2Y3DSPONlOIdiXbZS7d9IcUqE
         rXXQ==
X-Gm-Message-State: AOJu0Yy5ozoY3xvQIBu37hxHETLLBb/Xc0MYbFdBt2snXrcl8DnCi4rE
	0+7p3soMvTJke8gLmzVH2lVVST/hFRChEIu5qMMuNLRSd0fx62M6J80bh6H3PeJqLud89kNbUxP
	jCor+9A8w7Bfrpl4j+kTvw50af6hI7ZoZ6gVvrcwdOukF6/YDgpdTEGnzC9STGik4wuLQXq4=
X-Gm-Gg: AR+sD10kdm/M99MXPNzaqMYQZSrR9eWC8DoeA57Gaf9On7kloGoI0B3t49vGi3wTFdP
	b1UUUKMSt9IX7nX+cO7q0ML9/nbMyxk76LShLgUkpRVjATNu8eVt3jrjEcAykyCGg9GB1NEVHSt
	XvJxOcYH23N9kK8+NIut/l4JMTuohGkbWq7BlI7oANimwcbzIvnVaQ7LCjxArzuWmxvEw/PmIPB
	gNugFM1p4ZsSRo9vENww5mVx9ORHqCZqd0RIZQ17JJxVOqM/VN9bpqdZCZR/yH0pxS9mA2RA2w5
	g1TKnnyTnZEBvJsrQOpyAqWJS8DFovPWSPYXee57Xqfuig99rQmu7WwxBOx6khZFYk/jgUIDhvE
	PVu6ayUQjlL4C6DwRaoa3jWb0nUR4qngWZuPOQCamwyFJwplycNymlj/teJfdmpqdzlEuD/P40o
	gLOR49DJ/FghQa
X-Received: by 2002:ac8:594a:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52d73db00eemr40385211cf.24.1786616505435;
        Thu, 13 Aug 2026 03:21:45 -0700 (PDT)
X-Received: by 2002:ac8:594a:0:b0:51c:1c73:5945 with SMTP id d75a77b69052e-52d73db00eemr40384961cf.24.1786616505047;
        Thu, 13 Aug 2026 03:21:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539f45f1sm385324e87.35.2026.08.13.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 03:21:43 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:21:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: add NSP firmware for nords platform
Message-ID: <ymrmbgzvxmr6gkldjlg4d6iybqw52gi56t4clffooxoxhgjvyq@l24a5b4viu2u>
References: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd244e0-868a-4cb8-bd0c-fc2ff029b91b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: x9cFOlGV1z-2YnupbO8P9Vq1RuS9_cBR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA3MiBTYWx0ZWRfX2wbKD+SNFOj0
 pNMzV4Fz7/Cwd8A2dWt/NF1vbd4yegMVmlfpjtKkpKfbj/34JOsTfENRN6o+PxfseS0osNRygPc
 MJo2Ru0zqN6zIPCTJQGfo4lAYZncAmw=
X-Authority-Analysis: v=2.4 cv=G5ks1dk5 c=1 sm=1 tr=0 ts=6a7d9aba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8
 a=cCO1o9H_FYytE-6F2MoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: x9cFOlGV1z-2YnupbO8P9Vq1RuS9_cBR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA3MiBTYWx0ZWRfX7SX76IlQKZeW
 bEBWf2fae8rY/WATEj9BDQFViOAX5wtWzAb5HybqYweX04S3RrMAgQBbc41tn20ixALXHIqT8iO
 AVQsAszPk6JQzyF6/0djIsqx/TdCu08eM4XrvuV4MieBh/lNZ9ysqYHJHQYLhy1lQga2kflnUHR
 cFWqByZfDzcybpuzSJlUT9U7+r+VsiBDHf+faAM2LqwDSjMKt0KVNTnCClse9GVbaM7K02tFzOE
 9EE/XTX4kJ5Cg79Ffas0uCi0yFVtpMY4e+moYe3ShWfKwEwD32rYpYeFD61GKrzAsAfEUrSBQNS
 mvx7DMaB6I+Ck8shAlYSTwj/6jJcGIDjgFInlTETTlPVte32DmYqzozRFjmGV77Z0zYgsFMy2AC
 iVIClCHEG2K3uixytGGrxO3zWQ9S7v9f7PDJ3zeoICtUT1Z/n9cr2wsAPU3B69pbe3Ae35v/I8H
 yapt5dg5CtL/L91PSMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130072

On Wed, Aug 12, 2026 at 10:53:27AM +0530, Venkata Kota wrote:
> The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:
> 
>   Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-nordsnsp
> 
> for you to fetch changes up to a31906642ab7a73f5759e2c554fa2065ca548c5e:
> 
>   qcom: add NSP firmware for nords platform (2026-08-12 10:48:05 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: add NSP firmware for nords platform
> 
>  WHENCE                   |  13 +++++++++++++
>  qcom/nords/cdsp.mbn      | Bin 0 -> 3347164 bytes

Also, from the DT patches I see "qcom/nord" being used. Why do you
submit to "qcom/nords"?

>  qcom/nords/cdsp0r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp1.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp1_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp1r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp2.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp2_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp2r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp3.mbn     | Bin 0 -> 3347164 bytes
>  qcom/nords/cdsp3_dtb.mbn | Bin 0 -> 131072 bytes
>  qcom/nords/cdsp3r.jsn    |  22 ++++++++++++++++++++++
>  qcom/nords/cdsp_dtb.mbn  | Bin 0 -> 131072 bytes

-- 
With best wishes
Dmitry
