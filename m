Return-Path: <SRS0=9+rt=HU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356BCA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88C621F00893; Mon, 28 Sep 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790600392;
	b=DtnLR5TM1L6XB84wggJ3Pwkcy6awu2KwJpCb/sssViGGSVPF/5i4eTRKTZ14igAGcMth
	 3Pvj6Fi51GaeNbYB6o/VUfgjmzphS1ckIigTYcHB4JQfle08iYQzK19dNRCGHSS/PzDI3
	 71w3I9pC7EOVEHRJIo5yIAP/94RDQb3F5OqaPDbXOxRyLqBiv8WaogfvzpyttF901YbZ7
	 ESglepgOlBx8NanuwufGrDiczL+pogkfwiXYw0mUcxst2N5IFOHNT4kI7kzIZhC0oOCaD
	 GXkMWwW/QPR5URdrr2ubh0ksG2WewBbk539NMwNTS6cwEDMW6WuHYiEYC8Azc44A83w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790600392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NjdPE7H0ZM330ox+8h/HL/iosHPqkG2uhl1tQKFAwBo=;
	b=pWBUcsaojw8ZcdzS6nGaNNxrmqplM5XfO2jbFVWcY2K8UI0lXPmBh726GGDkeJFtAV//
	 /cEOA/ljPIUq3mRyWSlCxhlDBkvefYNIYscDW3U8u9/oEwX5rzQPrFBwx+r4g8vBzU5RX
	 2Sz02Sg/XZsLwNIXAkav/+PaOTQ4jSDtXXsETy80pUWuLVxo5bUn5+jk1qj4kxj0kup23
	 VERT7tPLl7D2v7NlN0cpbuVi6Intn9WC4/mKT7ABFxyXcOoSobHxg3kWeMRf+udz072hj
	 hBBpU9oQt0ZBYh6bdsxctVWxRO2rFMPQixeQNCwK99LNpydjd/xjT4v1bXRdDCJChOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RrIBSc5J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jb7wNkRf;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE1CC1F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RrIBSc5J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jb7wNkRf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DE1CC1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBASs1782813
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NjdPE7H0ZM330ox+8h/HL/io
	sHPqkG2uhl1tQKFAwBo=; b=RrIBSc5Js2YRKjXDzkQsycOK5VOrCnJgck2VjWnY
	Fzlas0KOL/4B7Q7M96216Gb8/RSuEp1raYqqlp14hYoCtA7F7Zb4AzgWVe155hTj
	rE1UyViAeGbfeYYtuV7EsAXf81lrmzM3gIuavhOeI+dKMxxy0K3i3onbvAN9bYvU
	KEIfLh/FDLRj/qEu9GnIJsfp8ZPtvVxEJ449Uh6tu4N3dnXoLpN5urVUHuY1HAXx
	8KQbN00L+pt/3zw65j25PDyORvnUpMLVYuZIJEKOYwt8WpugPWfjGd11z1KTlnAX
	KQ1NwA/0OZ/iSEUPoPQ4V3si5n0NGMqql92ngdOwoc1MPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav4ahsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:59:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53333acddb5so42759661cf.1
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790600390; x=1791205190; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NjdPE7H0ZM330ox+8h/HL/iosHPqkG2uhl1tQKFAwBo=;
        b=Jb7wNkRfnzsWBDJhonrGYh1/cgkZOBaU4gorbLn0oOneYndmVcaRWwAshmQ5sb+glA
         eS7rXhbgy2mEp2zTmegSZgfdJ3Amo9xUg9RGbAp7IMWJHYYUucgp5HyPGct76PXuQcUy
         9ipHMqdbDQAo1YCy38Hyc/m9l/BlMT47Cm8j2HsK1kBS5ZHDL17qxjgn37caaiG0TpSh
         8oC85ME064tJSb3K6muzz+QKQcICTRiFBB0DtUKv8of7CENF1/oeLpWwR6nNFKAgDFTd
         X9GpAR7DuKJ3uTAPV/0vK0+adR4rB+q/h2qO63auXZyFlh/PTNfnkcfP733UW2h5EUiT
         Al5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600390; x=1791205190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjdPE7H0ZM330ox+8h/HL/iosHPqkG2uhl1tQKFAwBo=;
        b=QTDKHkfWRuuCWhNQVGG07S0CGzcGffO0ZkH0cyroG00L1N2LKwVO51PgokrDHAw6uN
         FbQerjIdTSUk2T3j/AIYwgi5I0W0+MsOqzLEIMbyuohskY0xVQ7XzuvGpvYnudSVBPqA
         4pcNKHOQ9Bk5OJOcVdZYhSn/bXrBiNPHcMNLDP85hGb4OYC+I/+VozRbgqstyGoFigI9
         /hpSVanJDKY1TsFFGgFeh5qgNz3jBlObTOIHTW6xukxXt+wbjLrLUg4uZQWEhsbL4bf2
         fxjRRB9CgmqbOJk24KpKH1cDy3Z+6etBKCPq2EGN5ARMJ79ULLKrn4c0GVFY2nx6EpE0
         MrAw==
X-Gm-Message-State: AFuF++kvCfD3XCjVgf6lAbaK8SZgIXZVkwyVRe82zzqWaG501clmIcOP
	kvMO3qv6aVW+hB6dbhDg5svGtQezhsPXH+F0sf/n9WoIdLb3P9av9k8DSPExlQom0gFWo1OTIbA
	QNgD+TG+H+Q0Tp0vOfRQ5hHa9Idv58MMU/7b7dObZpzGAlAzJu8zpv9X0brICkoA=
X-Gm-Gg: AYBFou0hb2MjTHIAXyT+Yv3Nfi2m7e/UJr6D6K3j05/rKOz+5X7ii6kstjfi3JPtxSi
	NsCsBHJRqZLXRgcxS5pqtlL58G1kWYI2c0eTaSi6yZrNiIuYkCaYmKIuZVD6HvG6ofRSCCcP8xq
	NKKJKbWhSLu72ocW1r02kN1ScyRt4UCqZcMdm7AZxFroC6D6zKlQd9NJdo+GVzr4gqeC3okMRTg
	DIF9JEKCZr9zJISmGz424vgt/IOfu4fBBAvkd8mhAdfCbZKsfo51ypbjHgX1E74c9dM+DZAEavp
	nk/aFSlxpul66tGq2vpDc6mvciRvq05lJwWy90HmfruGyOW5/OWX0k/wt/stCceOx+DihY+njaV
	VRBgfdL41pOtPDTW5w0xlxZhgpafjuPKdCFd2nHoMeJG6M7h4JjVbhDqDWk+TKIZCjVChrkObFG
	txmRJhKrkQ+bZg
X-Received: by 2002:a05:620a:690d:b0:937:5298:7820 with SMTP id af79cd13be357-93c43cc592cmr2087515485a.8.1790600390104;
        Mon, 28 Sep 2026 05:59:50 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:937:5298:7820 with SMTP id af79cd13be357-93c43cc592cmr2087508185a.8.1790600389442;
        Mon, 28 Sep 2026 05:59:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826fa06sm482353e87.8.2026.09.28.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:59:47 -0700 (PDT)
Date: Mon, 28 Sep 2026 15:59:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for Hawi and Maili chipsets
Message-ID: <z6zujxtmjipbev2trqxcaiops7jgl47wyaclq25kotnnvnuhqh@5nis5bxsfgxx>
References: <4ceeb16c-d6c8-44e4-8a5a-1353040e8ef1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ceeb16c-d6c8-44e4-8a5a-1353040e8ef1@oss.qualcomm.com>
X-Proofpoint-GUID: TBQOD8jD4fljJ5i1h9gHpUcjeitkaQsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXzMkGuxdsfCkq
 3JazeLjJtV35ni89lwoSN2Xiw/bebWqpkMcc54qvAoUWEMPDrfZ9IhDVdYyo+oS0ph44FsGAIb/
 rZAeIbAIqa2AswyUU/nus0RGlFSK+x0FlaqSzzNGviLc1Gckdk54DDxXZtYKtxWUfiSuQvv4BB4
 H2n6lc6lLOalozS/r/FoX51sI6bEa9nYaPWOyGX9d6JFyOlZv1WzpZ4gV9kH48EHGJDzAicXLgc
 sqkf/O0b7rdDUG0yxXIRBtiwinPz2N2R4VmjjX1Yr3ZbAIA1ECuHtTEGO6pwcB0wgckLw1z9yx/
 Ry33054xmn6w7z5OdsaDW7KoBIOwp5Vl56VYoR5UdfEnaQA2MB8SLwWHAzipsTSoqQYDhbi4ZbN
 wV7hrP6gSke0sDP0dUzzg/jlr0tFtQryTvYPoDOqO4FP2MvMHRYH5qAY/o13nZZ8abuAm8IeldE
 wvdUn8WzintraGPM6DA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MSBTYWx0ZWRfXzYT9DhTzuQL4
 teZHKtu0Ma9oUSZgQYqrItHuO/rgpvRhA7L7kOFTrsLfBTS1W0T0ONxGSa7czl7eXHBQtabqzfR
 ZwARGUgYFivNM9TMbfLxtAxqH5+WbHg=
X-Proofpoint-ORIG-GUID: TBQOD8jD4fljJ5i1h9gHpUcjeitkaQsj
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba64c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=6wZp5X8x18SHu-3suTAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280051

On Mon, Sep 28, 2026 at 05:52:08PM +0530, Rajesh Kemisetti wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's Hawi and Maili
> chipsets.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1279


-- 
With best wishes
Dmitry
